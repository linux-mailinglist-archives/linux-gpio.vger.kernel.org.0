Return-Path: <linux-gpio+bounces-32370-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJSFKExVpWnR9AUAu9opvQ
	(envelope-from <linux-gpio+bounces-32370-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:15:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA5B1D5626
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56EBC3024176
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0F238CFEE;
	Mon,  2 Mar 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnJjmyCQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZY0j4Ht"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CED385500
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442698; cv=none; b=UGpVkw7JOjUKNSp2B3MTW1KMFhx4DmUZnTKloKDDhGLwT82sIZbzzaSlFQQGZu9uGjZNiOEoQ9hvBxC1yYtlU+Fl4AMg7AKRBoF0RBaOuDLk6h3oDudKLkdvSN5yjwvmq/hp3CNiT5c6thObcVRKTfNJ3tpsmJJE7DIZZ4o8K/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442698; c=relaxed/simple;
	bh=6pJyoCme9dl17eANBBEC5kVb2uSYzdVSd1HxlgwwNDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zsjux9+2dXnOfj3zFQhHyxbr/8drPVD2iEt7mL+ioRTfKJV+Q0WcLmwjm+OgbyPLULJR0DHRs/xqfXUL+HMjrcZtGSUMHjuGqhgCi/MVMHrz73i+tBrIQsdHmG7J3vVco2yj5169LZfxvt3oYkCMbtvqtDpH+ZYF64QeBPEhrzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnJjmyCQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZY0j4Ht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225ZVsQ911398
	for <linux-gpio@vger.kernel.org>; Mon, 2 Mar 2026 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mFjhtf9Bf9KEDoQa/XmjgD+QBmAkyj7gDKvtVNqMPs=; b=GnJjmyCQaCZLP/ID
	ali1tuoo0WMXavRvvUJhq5LLQooa3uLMbwyRNOPjdYREN4JH1L5UPDL+x+I5LnJ1
	O/L66T5IOukPTiuemit1kR+wRyW9F4DAVx7WZOqrxboXlrzmohbluDcyWyBgeW+S
	AwW5fLmTPQqug0eWFJGRFsTsLG5dKY6cZRQPGhaEH6gXiNy9e5MQ1MqSWaq5+51E
	xkYd6jlgt2fWxrhzIQW1LVyotwwzLj2OanVMKzfncdCPWq/S7l4qf8V1yTaEwlnI
	I979Pcjx+fN7Fs8y2aYAdcHpZ3kgZGE1Gi+mdSU17+hqPlVzNudtybki4l/JEFFJ
	qrzZ4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd4vnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 09:11:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ab7f67fso5450252685a.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442695; x=1773047495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mFjhtf9Bf9KEDoQa/XmjgD+QBmAkyj7gDKvtVNqMPs=;
        b=SZY0j4HtibSr5wJYcTRfbrsFlD8KS835WQgglZle8d7wIiFrAgl03LPlPnMjjj55XW
         dHSwW+aNmgZxmDPwY2cElPMk2NYIBjcH1CUCf/A03oIT4186bO6VBFKF1vzLAUz86zXB
         mkDxpIsCWyWIYcR8/60ic5itH4eDdv7mmN4Qyrc1ueDC77LdPjcUuKNfAWsQ2uzlv+5d
         3oaGC/wmAKj+Vlc/wVKUkP7xgSOdFppKqoHJPMSnJddPIMQUfl31AUmEKL2UQHFCUGiy
         WRS7WtXdhO3Z31AzIr2G+LiuCd0epbYMFQoHMHT0JrsHv+4AqmQZFDsuXKiQzsws+mvh
         R4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442695; x=1773047495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7mFjhtf9Bf9KEDoQa/XmjgD+QBmAkyj7gDKvtVNqMPs=;
        b=mO7pC8IscLzVH9YVqRD9urzKVRdmM0Q3kh/RZz0Rz+y3s6t5HtVcpXvmH61qBqoo3T
         l05GRzjQ1YTdLfagv00l0lkR0g+3hyspCb+Fn9x+ml44LloeNI510x8GBVHlqU0qbgaV
         YWJkxu2d3OiCmMAKNsEWoXb7J1iu0WfToynvoxu4WeImYT/rk0cB8AZDSZ+w2kuqidNS
         M58GncSeEmnCfr62zxhbPH1n1gn3AIdXg7yp/rU7ilwqqCGqfviWjMVZ1qOiZmtlvXc1
         o8VztVUPy9g6XYouG0yCN4IyyL6h7CcKeyvFGLGfccS1sE5QQzMprk1suUTq5NkYw63E
         WRxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs/ZI6LpG2W36VFRTerKFpmQ13HhNeADsoS24t6FtNEFdB9t9OXGf4E66nL0/eIzOCBHThDIWQdkrp@vger.kernel.org
X-Gm-Message-State: AOJu0YzJkUkghHOVe398AJCFzOAMzvX8W0GTDcOmD1z27/2MMchQR6Uv
	JTuPdCV1oMSYrCm6ahjJy8d+sMC4QzV2WtE0pxTD/DPwKMsc3GpifNrrNODAOh5rXEMn04ol98w
	43ek5hfG4TQgguYAlm5sPt2k7eDJBnBe269K8pY6GS4b3Mzbo9/lUTWCH+3zUvOat
X-Gm-Gg: ATEYQzwJljoo/HHC1lVAcxQ8M1d4ruaMfXIw73KtbbIZcLUt40CRhIFQPrZnYR3zOFx
	TVN1QUeKMYOVkbCfG4nPYnNRIjXYqm1G/sQT/MV7CwHbJuDIf6YgZ+V5qArVvdLPjbjk/XHyqZB
	fGiPsUUcyGv+JGSIYgZK4ci+CzNn5ccCKMRJfv5sd97RiInFSnMpOW8bXIxXSW6gpAlYCEFN9Gc
	uIvMsVZQl7QjWhBUjOv6yD9tgm1QA/G8ZZkVxiNfclNLo0f8j4R8x1h8iPI4JaltlKCaEBUDAbV
	9OyLviMKOHXnoNoJQ+b2BUDP8WDDBGbgLYJBPk1h1Gdu4r0wu51/soE6UqYbYrTaekPtSBLolpY
	E36htXTYmpvk+3m80lj5JmosfKL0pnjsrhF1SY5IP/59dALYKvg==
X-Received: by 2002:a05:620a:371a:b0:8c7:35f6:5f83 with SMTP id af79cd13be357-8cbc8e50c09mr1350098885a.48.1772442695109;
        Mon, 02 Mar 2026 01:11:35 -0800 (PST)
X-Received: by 2002:a05:620a:371a:b0:8c7:35f6:5f83 with SMTP id af79cd13be357-8cbc8e50c09mr1350097085a.48.1772442694566;
        Mon, 02 Mar 2026 01:11:34 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:31b0:507f:9cb:f026])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm15303097f8f.5.2026.03.02.01.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:11:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: Fix lockdep warnings in gpiolib_{cdev,sysfs}_register()
Date: Mon,  2 Mar 2026 10:11:32 +0100
Message-ID: <177244269011.9243.14252229480258430139.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260228131430.102388-1-tzungbi@kernel.org>
References: <20260228131430.102388-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dca7X2YqONO9P5W40oFuxmDmcGk33jyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX8Iz5b9Ee+HFO
 4esYCFqdIDEx4p31b8mHDjDs6MvuD9wqcRIv8fi802mvc8KKIP4XdHfS38itoTUkheg0VbWW8Df
 2z+0rkh2erghFW+TYhB0fD63lgkrGBES3A6bMEbQslFNLqY1xkNdMR1+XWZeZwwQ/+D6MHljC/o
 gVRCa9mwzJQbM80mO8jcmpzdja+GBhay+P7bBaBA4coG3/v8ZPbbX4GE5iDptXYyk14s9SCV3zL
 5TGnEIL7/2qT7QJ2RCRZ1ckRjgznj+YAF5RTXW38l/FeENeXlwqPiCNhLUeA9ZOPqLTeqcyYp2G
 BZqCP2qtQZGfLrsfamMl/rtepMKe6JoK51fl1tYPNXmsbwxk6hE4hSS75uYspdKnwbBdz1I4Ftn
 RclPyyjYlgiMXUAagER93LNrtNDpnmcOPLVijbKnylatwFnRwK9fcbQAt0Qu3N1z0ryfRGhaHv2
 TbJUt81fUIN6fty714Q==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a55447 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YkIJNMjZS7WNXo8oJMEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dca7X2YqONO9P5W40oFuxmDmcGk33jyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32370-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFA5B1D5626
X-Rspamd-Action: no action


On Sat, 28 Feb 2026 21:14:30 +0800, Tzung-Bi Shih wrote:
> A lockdep warning is reported in gpiolib-cdev driver:
> 
>   WARNING: drivers/gpio/gpiolib-cdev.c:2735 at
>   gpiolib_cdev_register+0x114/0x140, CPU#1: swapper/0/1
>   Modules linked in:
>   CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
>   7.0.0-rc1-next-20260227-00065-g6af4b9cfeded #12259 PREEMPT
>   Hardware name: Samsung Exynos (Flattened Device Tree)
>   Call trace:
>     unwind_backtrace from show_stack+0x10/0x14
>     show_stack from dump_stack_lvl+0x68/0x88
>     dump_stack_lvl from __warn+0x94/0x210
>     __warn from warn_slowpath_fmt+0x1b0/0x1bc
>     warn_slowpath_fmt from gpiolib_cdev_register+0x114/0x140
>     gpiolib_cdev_register from gpiochip_setup_dev+0x4c/0xd0
>     gpiochip_setup_dev from gpiochip_add_data_with_key+0x960/0xad4
>     gpiochip_add_data_with_key from devm_gpiochip_add_data_with_key+0x20/0x5c
> 
> [...]

Applied, thanks!

[1/1] gpio: Fix lockdep warnings in gpiolib_{cdev,sysfs}_register()
      https://git.kernel.org/brgl/c/fdfe3e72a228b74da21939c47ebd6f5ad4969d5f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


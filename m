Return-Path: <linux-gpio+bounces-33467-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH6RAFvJt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33467-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:11:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90496296C72
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90EA3301D979
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A003859C8;
	Mon, 16 Mar 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQP8bF4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kg80oGma"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E27354AC7
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652303; cv=none; b=ZZ5wZBlIFkPED+We9m5/nySJGem/WCnzHd/teyfcIeH0Voa0QEleW8Qhq21IN2UMjetCIE3w8tjtxZi9oaO7+C+QNhyxt755uEw0wA2p0Mx6VJz2nolxwZOaKJadlh5k5YcCvaOI5+nLCoJAaGbzYrLJC9+ZmySa4LIOBwRW1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652303; c=relaxed/simple;
	bh=kZPm80wKFxmRNc/j26BP2BuKbD7/LDn6a1ZiW65TaTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iUJoP3My6kL4BtD+VdF9URaGUqDlk4N/wLBLFzLhOoZNOJxXk2VLCy8zAbTjS7VkVnnafaq6I5w7cef/zzArXuIYIs159G8TZf8uuS9ympp7cFavGAkXzwwGyeJ5ZBhz/PUACpD+q6cCh+0ydFPaYdKOaM2mvi1iVhwDxsyQguE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQP8bF4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kg80oGma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gK7538857
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ykj5aaMN6QHqWaa7z2GGFr4msTD0B5X8Bupq8Am5DGs=; b=JQP8bF4zikGtfVpm
	/5eYQ4hztr3AZsU9tTqZw6OLPcYyIp4ZZpMYAF7uq4JvH8Y51e3BjT9TWedMxvJV
	rsPk24xaofzQ6szSbkeNwl+t3N8E/YcCgpgLWNYE29IbEuT2/Aw2LWhWVsl30o11
	XUPEre4Q4EX56lDwMutPZWDsdgBiACh7nGMmrSpqBp5lox9H5oNT0OVC9nnA1gCl
	YJq0Nc2FkPLmZNiBZZIUCFNlYoTBtasAwgbYKYdkk77L05b0oU0RUZuOJKKB9kcF
	GrIbx1DICpm0m7Eh7D5wKFpbm4sInI6D7iHkhQVAek7CLGqKaiz2j0k2CMLjCWGC
	DmYiaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5mxxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cdb995a1bfso2778321985a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652298; x=1774257098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ykj5aaMN6QHqWaa7z2GGFr4msTD0B5X8Bupq8Am5DGs=;
        b=kg80oGmajx27oX49lbyg5em5TIEMsIcLJo0Vqy1rnkKLY0GJk+aj/J0asMVmQV2QG0
         G7f9wSBkzG5AwqiVb5dzC8PQhg9tIeEeEocP0AXKFMtzDBdC/qPvoCjr8/OArBQQ/NXB
         Men6GE0w3F0G2puI4UZViAX24lZ5t3ZgiNtd6lho3USIEjgrLefYfBrIj8KhE0G7+FR7
         cKqz9cnGucuFAvfYQUhcUNxUDArLJWC3AkNvxGpn7tnio7vxDNoE4jJ6GWmXgQU11ntX
         fUQxnrdrx5eV8Y9WQkGnl33akBonFlSMvhdL2miZs9DFoeJrLaEIihwrJQSB8vskHPpV
         fcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652298; x=1774257098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ykj5aaMN6QHqWaa7z2GGFr4msTD0B5X8Bupq8Am5DGs=;
        b=TMcyj1jyHc1CjX6u8YXMO9GB8jSrDnqxu3zHFoJikIe+AAMDcIwQXN2+wFCHQzWZQA
         PpprKAE6Claj9w9ZLCN1qN8M7+ekOnzSJF+HfD4v9iYNZcRQF7oWezCKw+aRcgCVdlis
         qlN0frcn4bApol+SpAc5DU84tbO/i5baIaIdsN5ZOduXJ4llm8pVMqaLVAhrcxjceqK8
         XTiSB6+jWg8QrA0trpzfFODKQlKlP4nn6SUZexv4k5+koVaG+jmFRDZAojXnOCbNaWJv
         cDt//o2zTHqMw0QwihdGnIFgpoKmxeO959JmnXRBuq9dJdMwHpKsIpIxHK/8kBVfciBO
         kpgw==
X-Forwarded-Encrypted: i=1; AJvYcCW0n31s6pZmkuw4KhJAT112jrASWeQYwpF60ZGtL0mn4/6UoVeu3W/1lU2y2teUhlBCbcJ0DIOhFilL@vger.kernel.org
X-Gm-Message-State: AOJu0YzpiAZVDz9ixSTXnabsuXlAH5VVCAIVOx9UlMvhx0xPlIlWdA5+
	tbtZ7D/l8QoFaC4ZOeD3eGOe//oLKTa5D0PGL/LyMAyVUvzeMLjcIBGMMHX8mF2z6RcQ2kWxmQq
	7cZZ3U7Af86vhSmP6bNSqqr6dLWZn3KV/imMbJP64mMWhP2y+kiRkTxPd02vzhLBM
X-Gm-Gg: ATEYQzyATJRQrgZP4haezJp4pTqpHeY/sK+HzKGfZZpov0HI2qqLlXepiZKaP6sK5rg
	bqQWBwElEcZxBA51CcjCgbi4ryUqfK/MXtzyLqDCgr1p27aTVnu/ktt6lzkqQC7Pvl+aNgVHnwT
	ySrHc8ibf6ASaMt9jSlHv6MdME3MBTZgVII4iTFYQiRz4E8lUBP6ktGVZqds2A41ANrBL/Y+qOs
	HgVzDFBVqHVLoz/j4T9he95Juryhyz6yNqwnwwmsjzUIr/dfcESwJHvNUflyj9YavNo9MmVw+b3
	cCFdIeodo42FzVwfBXnVnCj8JjIlB/H3gTxb0e9VuaNNAjO9uJy+aprOGAyhDzsF+ckOxdjNgot
	FtSyRUt5frEuRneTer6YF1OfDxqIFVpAxsCjKKDV/HPSFDetu4xE=
X-Received: by 2002:a05:620a:414e:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cdb5b7b2cdmr1518256985a.63.1773652298549;
        Mon, 16 Mar 2026 02:11:38 -0700 (PDT)
X-Received: by 2002:a05:620a:414e:b0:8c9:f9c1:5ed with SMTP id af79cd13be357-8cdb5b7b2cdmr1518254785a.63.1773652298138;
        Mon, 16 Mar 2026 02:11:38 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2932198f8f.12.2026.03.16.02.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:11:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Do not enable the v1 uAPI by default
Date: Mon, 16 Mar 2026 10:11:22 +0100
Message-ID: <177365228187.54363.16650061564322541871.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314-no-y-uapi1-default-v2-1-578f09c91b8f@kernel.org>
References: <20260314-no-y-uapi1-default-v2-1-578f09c91b8f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jeoWyQiM96nyNKQ8a-neEM9KlNLKlule
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7c94b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Gu3kl1hqeh4EwtRtBV4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jeoWyQiM96nyNKQ8a-neEM9KlNLKlule
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MCBTYWx0ZWRfX0sWdRQ/oYcqi
 VMNiVi+X84GIZ8gw8ev0mlRJ/5snEiFGi/HBmqnN+AtTUszSHJv4eCAAo8AfOdN+fPIWZmKR2eD
 hH8SB232M7/mqLQ/iL1f9cd987CpUAqzgsX1JcU5lcTlurRf7FzafSslsN7VynYLW+2cH5m8J1I
 smyYVAztBPNfUQ8FD2xLG35DKcAHZ59Os8PxrjyP/A49XoLCU6PeTcoLkWMszrOcKkb2S259Ksb
 T7SoYTCO2aionD0YN1HnbqJmxuB5ha17T9F0wj+Gyj1lqTO7nAqnnqDj2SsgffDI88jzX9ombcX
 NJIN+FAz6E/yyWpSdWL59XU+sWICK/Z5TfIs8PniFErwvpa1nj2KvPkScb3ilaW1ZeBmix9OV2e
 vZgpqMSQhGF+EPdBATTvI8qXc/nG6xftN8csJ/EGJlwRvJAsl7ZsEn5uX6gJIDV/bFHLejBxPAg
 ywlBnj7Vj+i/FSTvBzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-33467-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90496296C72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 14 Mar 2026 00:07:50 +0100, Linus Walleij wrote:
> It's been five years since we introduced the v2 uAPI and
> the major consumer libgpiod is at v2.2.3.
> 
> Let's discourage the old ABI.
> 
> 

Applied, thanks!

[1/1] Do not enable the v1 uAPI by default
      https://git.kernel.org/brgl/c/7673e4c7f7f99bfc9f30294ac8ab769dbb386866

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


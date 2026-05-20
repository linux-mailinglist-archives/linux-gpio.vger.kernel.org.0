Return-Path: <linux-gpio+bounces-37201-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJC4J+y2DWrC2QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37201-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:28:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD5E58EBEA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 15:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3D353019834
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 13:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B363E3DD518;
	Wed, 20 May 2026 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgB/Xtw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJnyVWH+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518213A451F
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283533; cv=none; b=QpoaU7cYZ8KoBocR/gEgr17hA3Zg1Dzp09SQSL0SAW/dfaDjSBChNBw6DoAUcUkIbsJWyBHt1Rr3wyMVWXU5+vaj20ckoINL4wo8SHRjmbAaYBAGpKX5aj46FQ0jpR8J8qOaRWaNhPuYtncedZ3HQm1iQf3PdHwG9Zw0HB3AR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283533; c=relaxed/simple;
	bh=GkRAc/iqBkssbb0Qz6r1/idE25aPKhC6RWy2LnOVTro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6hMNbDKcId3WkAghHHKlYnuX/E8E5x4bhvWFAkz2pbRlTzrF/+8IlAmQOb/Ff3lGtkjGNxqjxrh1+vMu5GbJzjjZviLNkHRNyZeOwwXX6A0xjiNaHDMHyGCf+TWSjjGK4o/Nz7WA1GgWJI9DZoOahjS0bQ5jnntqWkm/fMVYks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgB/Xtw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJnyVWH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7AK4d1954028
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCEmLlJcOPXk8/JTmmah8TU0VEldG09aunulyVTkeGY=; b=HgB/Xtw4kvsqI8mK
	3cxTWf/xaulluPW/ZCC5DnOVYXihFtZym+LxvjJznBHhI6fBdpXFMGtYV50Da5Tt
	dQ8ehEmfXoZJOKOaFWiLgWwsIAPoA8itfShLa9li4PiUd7zX6ZhiKB3pCg5SBuUn
	DZcWEQeyUFKyFfyXl4KZMFmSjk7EdZsYzEtSiUvvmThQQFsovzOcdsBBqjRvd6lA
	quVP9hfsP3jQi0iFHbj/x4Um1eZXNglt6IE05PZ3g8TPYiT5FU8RWcxGX2+GwtFy
	5hva4FySqhWZdk9emdCksZLvrbyicGW6hh/BKVL720Y49g2m0c38SQImPmytINuJ
	8qplPA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xvx57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 13:25:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-636fce7dc8dso3112740137.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283530; x=1779888330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCEmLlJcOPXk8/JTmmah8TU0VEldG09aunulyVTkeGY=;
        b=UJnyVWH+aUAGVhEHoBQSgMX/HsQ0KuUuQL0+l5iIgD+nJ7YH45jbhPn+J+hrPlPeUm
         HHihJY3/Kpp7EtRV6QnUywpkiHTzT3llMV8+Ud/cD6YrSuhL2DxuxKbXD/2zemGqZ968
         8cgb77z4OJKyOkWyGNkgv4SD0uD/pQoV/ky4N63B7+kbFn1ttILIh+IBw/BfbEymXQcI
         +JeirXtDUjAlcl2HHdwnMmcg+GxIZwwH1+E2z69wrKnH5WhBsz6BkuE1iPZ8hpZ9j+We
         /SJPzazm2fOEB9M1HBVpRY09uViFCM/5rCECpGsX2CFYAsmZpsSn4qe5XpZizVtI6weo
         O4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283530; x=1779888330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCEmLlJcOPXk8/JTmmah8TU0VEldG09aunulyVTkeGY=;
        b=IKPcar6rMwJJrKOOb+y7W0wLQI0+Y3Hc9MsXHvZKNIol0d408Rm1mYzhHdWvNGvrht
         Qo6xHyvPTd/DcR2cRhHM2iB54WQfpuVVDdzrsRqW3ysyCyIlo6FGHDLG77Nq09l1f5vp
         jrW96OxLABkUSLQQoPIxmza2z/usO9yoT3rxEZLX5a019IMVQW2MshvkmO2hgYJcvgcY
         AYhNwfQ+k9qM3Dp+U1NK7d8UPJS+egCuErtqWxNcuW0UwCNVVjF6eEkgahWbs4wtXQbs
         gdU+qa5x3+pzAA43QLCeLI/gu07037rVyDSc1HvAU9HhhyMlL/3pKqQF+V04eIE16BMK
         XXHA==
X-Gm-Message-State: AOJu0YycpVjVGjbJQQntlFZIChsVM62RcuznHsOpzyEC4dbOdqFMNfz4
	rvQigYVk/XrAhuaxIkM3xERV6VsPWlHsKxxX3PCwif3BGUQAaELle1y27V0Q9NpZlJtcXhp2VHh
	xm9RyxsJg22O1OIrjGJsEX9H+6URBMQlBv4wdmtqRLi1Ske2T4i2Os0avNGB9p+bxj6vt/Qxa
X-Gm-Gg: Acq92OG/fgE6E8YJDHw+6C9kKwBMUjLC4w/rxti3xgx+hYb7G6JZdwFHoJOYaCqZmSl
	N/YNtKIso53YtDaZg0GrCv7uCa15xf+UoqyIr0P7MzbhVgYd73Kory7xHr9xvFskRWLDSl+Ts88
	+KVZcJnFXC6QtNgQsCjb7zvc5QvHs9D+qBZZCEfWhHyfnjjUbHgMBPlZkOJ1Zyz3ftIzPB1oHBW
	33qEamWH6qMOZuPLJb1M7tSFa+0aWyR7MCbncJCY3jhH/JT09zPiRgBooNHuSjEsLzcBlIFmT7W
	Z6ERE8VU9aAjpEk5Ggb3+4YEE/gsrfVJBvqc3MFloGp5RRUQspOEanRqLONCepe0MgGi/ERNNj4
	7B84vuh6oGWqkcj4xet50U5MWTEDLQ95Ms8hqXHdzYz9C8xbG+W0uXmaF4SvI
X-Received: by 2002:a05:6102:d88:b0:631:2472:e832 with SMTP id ada2fe7eead31-63a3ce1bbb4mr11793318137.8.1779283530524;
        Wed, 20 May 2026 06:25:30 -0700 (PDT)
X-Received: by 2002:a05:6102:d88:b0:631:2472:e832 with SMTP id ada2fe7eead31-63a3ce1bbb4mr11793237137.8.1779283529973;
        Wed, 20 May 2026 06:25:29 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm127925495e9.17.2026.05.20.06.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:25:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] gpio: xgene: allow COMPILE_TEST builds
Date: Wed, 20 May 2026 15:25:24 +0200
Message-ID: <177928351978.51371.6619452121180197526.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519005958.628783-1-rosenp@gmail.com>
References: <20260519005958.628783-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0db64b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZMuc1FsqzX41soSqlgcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 3snSsGI0JhR1T9uhDKkebFP0jVJxA2PL
X-Proofpoint-ORIG-GUID: 3snSsGI0JhR1T9uhDKkebFP0jVJxA2PL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX67vZVtFIEJ2F
 kkseq+IxsPjaRhkuKfHg3y6vuP90flO/Rcin80kK8KDOykNbTxZUEJJm+ULdWe3Ukt6qqfUfJde
 +yPDPh0gKBCIsHYpg0rxMiQ6pqNmto8QjskFAN82jDTZi5Qboz2sZWb9SfRUtfR2QG8wFXxY/YQ
 keJSCIZdTzsz5eMnHVxJTghYYM9SelfUBK293FtwFpoSovEhefMkcVSmfnnIe+KwirxyozNhfW3
 W+VsCOkn4PnDjmI9fifASTd8h08XPaFacdneJF5W5vGkkI7/UKVXQ5jYxCJ+shH1g/MZF+R1JV7
 HiSLnp2gCtnhOwpTV+LzyZ3UKnMLIbXYWEciNEYmmRi9et/G2nmTi/jZ6UGzawAJaPdps6sc5G0
 Lgkhxt7ZX2d7IsyLultMNohYL+dvwY9XHkgjoMI4FXXumwnKKVTx4YUkbjEm/eY8UMtaV2iah7J
 YXOCCzdcCmgFfA0oRbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200130
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37201-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CD5E58EBEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 18 May 2026 17:59:58 -0700, Rosen Penev wrote:
> The APM X-Gene GPIO driver uses generic platform, ACPI, MMIO, and gpiolib
> interfaces.  Allow it to build with COMPILE_TEST, matching the existing
> coverage for the X-Gene standby GPIO driver.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/gpio/gpio-xgene.o
> 
> [...]

Applied, thanks!

[1/1] gpio: xgene: allow COMPILE_TEST builds
      https://git.kernel.org/brgl/c/c7b929fe289d6e5118954f8327c143f8ad707a63

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


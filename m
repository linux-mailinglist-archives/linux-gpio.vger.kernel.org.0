Return-Path: <linux-gpio+bounces-31479-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HPQG/TMhGk45QMAu9opvQ
	(envelope-from <linux-gpio+bounces-31479-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 18:01:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EAF59AE
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 18:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA07E3024294
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 17:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D97B43635C;
	Thu,  5 Feb 2026 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sm2+HntB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSWBqBde"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7B2D8390
	for <linux-gpio@vger.kernel.org>; Thu,  5 Feb 2026 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310878; cv=none; b=gYa+NY0MaWQKWa+523O9YvWErGAhGjV9sKyockRVQrqI5pmdPWEawnvVy+fd3IxUz02ytYfrQgjKcqwfOyV+nwrBeEss61DiPzDStGCZvMyV7sXSUzuWOqeMkC9LH/b4amXGiTeOLgW0REKac4R4mk6RH9Yn74lh4D9YTOj7MoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310878; c=relaxed/simple;
	bh=wRvnW5h6KNITYh1tmRC7xDnxizbivhglmuQcSNFSVrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=slqb5e9tL47FmJGcVb2d0UveQEnDExzKT8CB1wGuNh8AljJMiG/S/tP++Lwpbb4P4YAPeUjr2K/YMpg/DLilZnYENdvvIu1QGEePqGFuuZsCcDAC7Xpq71OMjt7dSAM95r1RFOlF15m6zaLP5KEcR1vzElJ+IGCnvMEsuoDjToo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sm2+HntB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSWBqBde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615FrJLN871877
	for <linux-gpio@vger.kernel.org>; Thu, 5 Feb 2026 17:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S28Ok7swAku0bWcYIZDKcD+wCp/F3YgdkLrA3OK3wZs=; b=Sm2+HntBecTJSst+
	KkQx1QrSD4ep0ljCI6scr/fDY+CEP2IRJ5PTgfaL3u3KT+7Hkv8zWUk/GxCRlOPt
	VJpC/qTWFB0O3tgNX/fVzy6Qv6IzMVdV0QD+MReEQrIG9UuG7NXOXb8TiD4PCGyx
	woX9fJqOD2XdOIuaezL4Sj+wgJ4wrBwdnIMfUnYxYkCRtGs6LxjHzKBu/BF1PbWz
	FQse65UUSG+mPZ3X2kDC1jYI+UR7iDEl/93w/cw7QB5JBNAhwNX6gfJ4qkQc+8U8
	hhl9Tc6VXmwXviIHZ0y++nvM7AXMnzY2ukT/9A8eJcM8wTrtCqv0wdgugMM3oY1N
	hWCAow==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bg7gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Feb 2026 17:01:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5662a8c5976so1220755e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Feb 2026 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770310876; x=1770915676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S28Ok7swAku0bWcYIZDKcD+wCp/F3YgdkLrA3OK3wZs=;
        b=LSWBqBdeYk+Jh3sBb9pThLKxg89TqA7GZwO1b3mwr8BXGji/Gxnc+Zz1dXvrU0fZ5U
         /TyOagJ80Sm05eJ2Ogk37GhzZYFmZ15NLDKsps9BmaJB2OxLXL61MR21SGk9A9FXoiAK
         9tq4qcwG/WR6YX4ZhhR9Br0kWpTlhIDbQunMUOiyzAsFfv1aN0Cr0KkdI0xBZaHlLyTy
         jcaRV02C2n6KoI6vp6nypIRb20in7vZjHmuqBGfL969aYf9dvDtUK6HhVhkyYSNMwxW1
         YmjIox1QkUkhDmbRTAPHjA2TxlI+iaYznRdNgpL92uzOcbTpcFPLeJP9rxYel2E7B4oi
         R4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310876; x=1770915676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S28Ok7swAku0bWcYIZDKcD+wCp/F3YgdkLrA3OK3wZs=;
        b=NkBdNq3ARLfxz4Jri6drEWayQP95taGYsb/Xu7uaqVukvLfcZ2HmEoMxcA2R8g6aAB
         ebUhEH5GNdMyFxmGvhB3nc35XlyCMSVOmdWUVCU1ONiQUkrAZ1oGyLSzS8HWfTpjggAG
         qzIO8UOKAjsfuD4G5KF7I6KrJTQMdj5Zv28O1sAUy5yfvesZc7vEGZPWj418x+c8eVh8
         U8X+uqjywDUI2ZldGOnYUFAb66JgdqBD2fbGMgUAxe75+cuEW3KCNkwf1se0Neh9t4Ms
         fneWUdVsN3qZlDHsgo9TdLGsxSyXOAQMshbfyEJC00cVrnSnNWxJvVtVZcNzGyAbxMdO
         7pRg==
X-Forwarded-Encrypted: i=1; AJvYcCV6wlbPEt9+ILkEEi2Is/rXlvm5exN/EuuMj4Rhe5fGBehHM4qk7HVOc8+GWz8mNpvecpGyC7EmCQfe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1wC0ijP6JOkzqvga1EiPjsxSZz/Bfi3uTyje2uTRXZggW0Jx
	HE2DdhrMjDF5APtoyrGCCcByj2GxaKbPmbt5sRgwxI4+NuiO4HjnoaiaNCQdcFVHVY2x3CguuHm
	9/7ikk454T2k1BuKVjdlnh9R2noyOyscd8IqB6AzUgc0Y3sWPOy1WCwdVhBd5MFYG
X-Gm-Gg: AZuq6aL52igGiLfQFD1lp39F2A8zJwAse3yNCRSBEythLpFbqAfM4lYihwxTenpgBIp
	gMBsDvwwiIKKiSno8NrGh6o0IqrSJ4rqni7L2O0n6WGsCtsz0Uc7k8R5wMU93fuPO6O+6nVy9pF
	eRif1KXOFCWQuXkBYPoSw346SKcCmGHjWvi8fT9EJQ1sO/tL02lMmCktfyhZf5dI4hjxSb01Ke7
	tF3j4u/tSXgy1YdiYQyqH4QC24pfX4QFxIihmcquATmy0oWZnYvm4RjmjmuG9iPZeFLSHlIkGYe
	MQT5hBPkcZBy4by/LAsvPUhuhIOmoOl+WXepk/aptH7U3bXRnCVYBbofPe1A/CZ6sp0yBL8CZHY
	JNRI4RsKjEv35xsZpgH3n3CJLl1cq4WykQGk7+lc=
X-Received: by 2002:a05:6122:3310:b0:566:7d83:dfdc with SMTP id 71dfb90a1353d-56705f0431fmr3941e0c.9.1770310874586;
        Thu, 05 Feb 2026 09:01:14 -0800 (PST)
X-Received: by 2002:a05:6122:3310:b0:566:7d83:dfdc with SMTP id 71dfb90a1353d-56705f0431fmr3846e0c.9.1770310872656;
        Thu, 05 Feb 2026 09:01:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ae3c:ac05:b9e2:3c11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640f2sm13859323f8f.39.2026.02.05.09.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:01:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: zhuyinbo@loongson.cn, linusw@kernel.org, brgl@kernel.org,
        ziyao@disroot.org, chenhuacai@kernel.org, Chen Ni <nichen@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: loongson-64bit: Fix NULL check after devm_kcalloc() in loongson_gpio_init_irqchip()
Date: Thu,  5 Feb 2026 18:01:08 +0100
Message-ID: <177031086594.32998.6252082954971508182.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205072649.3271158-1-nichen@iscas.ac.cn>
References: <20260205072649.3271158-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=6984ccdd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bsqU6LQUMau1XypvdBsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: f0GUHwXrB5r0jh6f-VUFks4vEDT4EuGU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyNSBTYWx0ZWRfXylTsfCCi4OYU
 viG3VzLsfRdg26aelV/TuSkUpjvK5b+DmCHXemUvxdJZJAQfHIaQdKfB2xHAPdAtNjM66uozUip
 HMbT3aXD+BeHZGdG+yIWFoaSuHpr6BhS//b+RpEf9fCUgrtIfNKhrFSY0z+WOSiZNouy0rABCFa
 G8m5lem3Ti/gIBbLOj6HABXGTIOWKW5w3+pvwC68x8Sorm+H87UuDTkWJGhreme5wClGTYHdrce
 CMDDY4n8U0Wpc7z3iiTfvG2/1VqV2BFCIz69SwC4+gX4BSQ//XX/pTPt1l9LBwUdursS0n4ZEac
 ACFMkvKQ3fCylcmHKS3rtP7FbDaZjX6KpT5qOxkNKIek/Obh7BN3SLy7pXVFnxHW4/PHIHElxV7
 OaStsBH7fl6RDyQB5a2KN1WI57QSVKEZxVY3UFy13V657tySjRi+h0u3yWv6dyDZCE54sGXPJMp
 uvMDRY5cu59bfa5kF/w==
X-Proofpoint-GUID: f0GUHwXrB5r0jh6f-VUFks4vEDT4EuGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31479-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out,oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[bartosz.golaszewski.oss.qualcomm.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 181EAF59AE
X-Rspamd-Action: no action


On Thu, 05 Feb 2026 15:26:49 +0800, Chen Ni wrote:
> Fix incorrect NULL check in loongson_gpio_init_irqchip().
> The function checks chip->parent instead of chip->irq.parents.
> 
> 

Applied, thanks!

[1/1] gpio: loongson-64bit: Fix NULL check after devm_kcalloc() in loongson_gpio_init_irqchip()
      https://git.kernel.org/brgl/c/e34f77b09080c86c929153e2a72da26b4f8947ff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


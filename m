Return-Path: <linux-gpio+bounces-34191-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJBRLdfxxGnv5AQAu9opvQ
	(envelope-from <linux-gpio+bounces-34191-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 09:44:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E83318E2
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 09:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F1A1303A489
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 08:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5513B8BC6;
	Thu, 26 Mar 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwqFVl0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvcN3VLs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECA3B7B8C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514466; cv=none; b=mUuqvR3fSOLTx99ZkB1k6jGUZ8Zis27Rsl5zEyt1588GUeVt9+grM3bFFUCnW9skbvbB697BpHOdCI3LWQ0IVA/cHldTSnTeBjI5S8mckFOFNX8BlSZdYZanvzB5KTtkqn8TaC+6W09A0aVnzR+iRKI1p9oy3pbcqHjw0iK8zIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514466; c=relaxed/simple;
	bh=BTWdYF64zIa5F0wvNZbYT/vjVTO5AzLcuRatDC/hPHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NyTP7aqSJQ4B9wxiWUMBH3VgWwIVj8IVwoBj76UWomRM/a537UMtTm/BgrTMmBRirtESdn8IUcU+jPNjE2eWC1w2AeTCLQcw4VzdIpw6MJ8SlXmefflc/Krugl8Zcwec4O2Z3WjjXDYRhN0JUchC2XyONWOvYF2wHFkp3IToTmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwqFVl0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvcN3VLs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8TrGM1811861
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 08:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=; b=kwqFVl0va4Ro4+rt
	fFgR1pQCzXvp8Mms5DBXi0Ow2aYvPUaXH6hlIhO16WnSpOV8MwbNlmWjKWe9TKJE
	J5coywcqs7VMaFOehqKnkiVjfyGA84VV0WzF2crMLMozmnJHtB31gFvTLueSbfT2
	oJz/npWpybSJK7bmwLETA+J1htz3aqgcjl5OnJrb18YiV84BH13+p0O7sLaLxWWp
	qjvKUy1ZBqwJmFSvaZsWvbGKJlGUI/ksvGuSF852jMxu8vFHlEnGMIjHl/YKvGZ1
	YDL7/rX9w/6AkkPIYPuiFYRcd6YJpfYxMRNWh6hNffJVdy8pY1E6zmtANkTByNj1
	7zCBdw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn1ct4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 08:41:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b802961ecso12762111cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774514464; x=1775119264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=TvcN3VLszsD5YiWIeuryCRTU3bLdfLiqCvIlotyTUzJah8dRH17cMEHSTdKeSnlemO
         E1xpCuC/CUDKlXbapEdoPb7hw9XtJ1826U6V5ERYdygrEEZqDG6Lu0OZS9tbHnkqOnjr
         8Aie/qmj70VI9KYMHwx816ODGgxZPF+XvF/wAIuYYd1WPqrdjbzFeNPpDb0XY46dFb9J
         na35oFx2a0G0/FqZpS03OolSE4SFurWEG9jtXd3LtbvjjZRBkyswA7JbMcp1GFCytvAk
         zkRoKqpaK8IHlEU3j/525cwVX4gzZbOec8klpRmkbtWMZmBuKQUgc5t1ThBvVfPSPzQW
         Ygfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514464; x=1775119264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=empW9jWc6QhCfNPpxAU3RoLVbj6DcDiWksi0zLN4wCp5c3l6nZcB3HVfRjudfotRtO
         o5H2KU/1r6JzefSrRvQzoUOPN44ywrlOqtZjkszOVRrr4mpE5U1WWbXZ067eBodqdU0q
         6yEDGuahLhNAXzzuwQZ9+IC59STcow0FXsQR9mRysbihoshz8dBxa4ctAjxgR2KPqIrK
         Pqg/a+itH535M2Gd3akI23foeHKQ4oMstQaGrYL7jNKx8CxOUIXQxCW56qXmYwRIbx3k
         vMx5tL+6B0frZ2ghcbhbXmPkT/fMAnKNXyy1EbHoVhjF+J27DlsrTqOLVxqoGfndqnNg
         yBbw==
X-Forwarded-Encrypted: i=1; AJvYcCW7R8Bd4VLJTGCWK7uMVzv+7EG6/VWwbV7JngxE3ATW269cwmTrvSj0LxeiUFkVohvk8DpW+V24c278@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdarYuC3fo1oAdacXgir1cKbk78cL1X4QnOEeyFagjILH+unT
	14ddBiTfJzfT2S/q3xVcgty2jec19efE3Bp7TP5kp6Mg3WKTGTBt1zFMPB8Fb2CokzP+dg1DsYb
	o82bWhar88rwT5Rt09Jqdg2yBQtlLOrcdebrljOxCZghhQ5NmD5WZ3fnOPldejyIY
X-Gm-Gg: ATEYQzz1QUBDhRnpMoW/hw2XM0xqBQSJFy6A7wkDVO9bOBUM4xcGYiiZrVB+ekUyNc1
	bl5VeGEWQkIrkwuK2ouDF4h7ATZX7J2hdkuvWmMyXLEbpcq0685eT6QM603dxfULHYiwrqKlsnV
	pXPcaGK3uSIEjY3S7pbrMDeJu2334vVBcwsXtLoaKRTE701H9/LxCivhRnichUhzLqsXmSqiYt4
	U4nGbsAmCTTPYXZVccN76abG2Yrmxyzn0eVp5lvYM4ABGSGGPxC7EFVI2CS2KB3t/ppmZc/h6IE
	zew21LZymOp5I8v/1cGqQXydUD5qyqIYh2QQuHpfcuAtX1kUDoPufs34d6uaW473kkxqwimEWk3
	KKbOs0qzJuDjyutAPfu0eFaw8DBlO4ON8MFhSNW6hBRL0ANKdAvI=
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222371cf.36.1774514463722;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222121cf.36.1774514463190;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm16608955e9.4.2026.03.26.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:41:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
Date: Thu, 26 Mar 2026 09:41:00 +0100
Message-ID: <177451445822.5060.11939390617609457696.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325100144.1696731-1-arnd@kernel.org>
References: <20260325100144.1696731-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MiBTYWx0ZWRfX8Pc88NvHNFn+
 EBQuW5kfdcJQlXjjV2XUmMfIjrDmYmamfYVnMWNNVTC8D9ntwrIpMeHQByDeXJPSaOTJ6edg8bP
 wRMgVD0GyDJ/NF6JuluSd6TzMZfHjdGqd4QuWueHXf0SyqLC1g+27abaiyb22AzY2IiyyNESrlZ
 1wUOT2Ec3DuThH9MuV2JHLQrdACtI093cyQu63n0r+GVZZqlIrkPEdB/zW402HVR4VvyiXPmv2j
 EbHcj38LYeeXE8LFPJGhyx4ezxz8M25Tqx/tWv5h2yGPa9rl10cDz4z6GC7fFHQM5q8pH5Go24i
 gJ4wgVeGvonBRP9H/tfXVLE7U/gtr4/0bQ+4MJ0CvFv4SzuIyJnIv16pM98ZNknT8jwiwKcHZGU
 mBlo4YEwhn5Idl7p4OfNXvjkQMaKdRFMGubXV6l0gLlUGSQEF6kNzl8P/EzO0WoqQIqP51wGlRP
 3QuJJbJXkgNor7xnbAA==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4f120 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=faeRYzTSnDSNNYB9Nk0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: QEQFxC5U5MFcXIi2PsH1-A5JKnA-T3cZ
X-Proofpoint-ORIG-GUID: QEQFxC5U5MFcXIi2PsH1-A5JKnA-T3cZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,arndb.de,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34191-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 573E83318E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann wrote:
> A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
> to build on targets without CONFIG_OF:
> 
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
> 
> [...]

Applied, thanks!

[1/1] gpio: fix up CONFIG_OF dependencies
      https://git.kernel.org/brgl/c/af475c16bc02a08ed6af6ca0c920f98a45611fe6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


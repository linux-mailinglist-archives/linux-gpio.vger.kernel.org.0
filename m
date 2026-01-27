Return-Path: <linux-gpio+bounces-31132-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO3AGSiIeGk/qwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31132-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:40:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EA591DD7
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F172030C249F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827242E0B71;
	Tue, 27 Jan 2026 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7ElyRuO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Evs/GIjy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0DF2DFA2F
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506547; cv=none; b=OPFt/sZEdGfYI7q+V7CxsS94PKHjf6Zi0I61GshKkeiQvcqSdDRVIabwjWsF9ENKshpGHvNKEtG9MUmL6Bl48FrEn3uGhkUfKAdS9soXRIRrnBDHrWCqcEFZEXKT988dRYiJD0Da03kbtoFlygNNa7a4/8fgK1JRnNDBfzPmOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506547; c=relaxed/simple;
	bh=69UABQ1/JhV/RAEIHMGv29ILCyLYJX+p8MkEXG/6Qa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c1NLFloNvph3g4Xax0S9zwfrJcnzpS4DjgzsMEiPPfvFfWH8g59XPr1baeQcEUmKzDX0Y+p+Dr/8sr9liawreoLMgpbruiVR/gK5JT7K9o1nCJqiQ2f5Dq2gQHNnZi2Ux0/6Dh+zZKIn6eBDkg9h+djOwuyOgw4/XNLzIQddkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7ElyRuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Evs/GIjy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7Rs2i112453
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	noaMhMcAu6SYgjeX1out37z9msTxX/Kt0B9jtQ0OI44=; b=I7ElyRuOLETX5Ku0
	deBw7ivww8Ev/u2hVa2G/iXbq6SYpLpNEm94C9F2b2btnkOtgNRkC8QvBx/lt/Xq
	zPiXwDunUXYw9kX6UbyfqlBR+O0TcmnaA5roMGFf9zxnf2q5/KmZvPncRa8ScfPu
	HmictFoxUb9OB+b9pixMNqw1Q26Wz8cjJak4263aS9rSqkeqXbKXd7RN2ojW+nWX
	RBQ7c3gQaTdeZ0aWIDh7H/D31PquzQGtgDhlrbUCTijYkPPDSBIssnCB2shw+mTC
	VjigEoeQMduGgB3eduZg5WrylUknOqiZWHmQrQAEUb843IvdA8rxx99NTEsej0xk
	jaHLng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e0g7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:35:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502a13e3e55so219259011cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769506544; x=1770111344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noaMhMcAu6SYgjeX1out37z9msTxX/Kt0B9jtQ0OI44=;
        b=Evs/GIjyxsoolOab43aMPBfFxGyIhXJjZIOW+GGuBL1VaA8Dik14gF50f1Ud6sUC2x
         9Kln8ciixcVni91ghIyRwFEAsDmJOfB41myS+3N0XKcsUihgxozlfAG2Q1S/dMNPV9LD
         8uFsZ/9xETNuJ/n2dOp4LEW2f4tyKc4/eXKfxjmDRqBoXTbal7evT1N8XCQugLXiJWg3
         zEXtB6jnUzpTlqtP6ARzOsOLDQmya/jKlF38SkvcvyRbcyavCfCLIS3RNQfiQ0f8jZrn
         PWoD9XYC0Ms0m0UoQSlSF+IGj5GfX0OSS4q7r7vh0UeN+1HHDm1Q+B7BDW7Q+5G3v6vn
         PY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769506544; x=1770111344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=noaMhMcAu6SYgjeX1out37z9msTxX/Kt0B9jtQ0OI44=;
        b=Q+rrZLkzYJXsXFP84FDha1yGbfocpYt/lhFwR+IzchyUUsWGLQBs/cptCrz5BvKWEU
         S/dgsro115vIUGnJhxP+QPnTtaAwupNA3Pg1E3aRkiI1u7z1zpOWvRDddAMItZwDAIN8
         FQQGRkpT+Dba362qvYoFd6YsNLDen5m82bk4TYEfkG1fHONP4//9J7RcgBz3vcI9f0HL
         rZVofOWqzdba2BrsrukAEQ7ux3Xd7w3z7Ra49KvLDEFjZyBFSshPE2kjDY34P9S6F0oV
         ygvfPpP+GBX0gXfrRE4pbgCGeoALCJhl4opE357w/d5u/KWlWlL+qXmbOiCiKaAcst2q
         YhrA==
X-Forwarded-Encrypted: i=1; AJvYcCVnF2JIFFN7fFh8+29Df3tWupDi0EV8AVxWF78eqi7wkE2uQNvMCtB47TvyyX2jkdA/jc1hoDbofyuk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/3AfvrbLj/uPetdppAMqptGdI5t7r4BuOvDOihE0bvSqZrks
	6hfkpaIeQdXAtvCeTZ/fzu84+QzG1vUHjhgJ1JNNDmOFN48iSy96dqpQ+L69bJP+CtKWtRHjrhK
	eW6altpY5WseaR36XxDCV08eXYed+Uq1AAULX8AVH8TB3pmW3ZHJISkno9RnffIrd
X-Gm-Gg: AZuq6aI4dOHA3lXqh3gwdaLY1xClomHEjGc0cWXO9whSCFIn+FyMBQZNoHs6JAUFRWw
	2qKAd+w5+8MeN7cLO2oXjV3JO2QhwMa4BWeVuO8imshOWZzi1KmxI5Jew4U4S5r+doWgwTsgcAd
	QH9nYGojlZf7WvbJZa2yUeUvl/q0//57kx7lQG/2btaSD+x+7I6KR2Kdhyc0j0taBdBu1oWwvK1
	Kvv/wnK/OlWldNcJ4fkmRPiVv1vPUhEF9PWmtSXywpJ/s6oNEnnRSMF+jy1Gxrh/fPk/nUwoViP
	sKX/ejAaPjAlE31fEh2BQe0pz993cW9k6H0j3Ee77gWtVsmgq8POaYtZm6L8TrK3kM6nd8JsYmt
	RGRzYIREVM8UtjLDfUuuTke4A3JxOdrL2GTjBc8k=
X-Received: by 2002:a05:620a:1a16:b0:8c6:e11c:5ebc with SMTP id af79cd13be357-8c70b84a8dcmr109663085a.18.1769506544449;
        Tue, 27 Jan 2026 01:35:44 -0800 (PST)
X-Received: by 2002:a05:620a:1a16:b0:8c6:e11c:5ebc with SMTP id af79cd13be357-8c70b84a8dcmr109661385a.18.1769506544040;
        Tue, 27 Jan 2026 01:35:44 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:262e:d32a:e347:8b74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbaad79sm123425275e9.9.2026.01.27.01.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:35:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Martin Larsson <martin.larsson@actia.se>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: mask interrupts in irq shutdown
Date: Tue, 27 Jan 2026 10:35:41 +0100
Message-ID: <176950651814.15530.16414824945877998617.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121125631.2758346-1-martin.larsson@actia.se>
References: <20260121125631.2758346-1-martin.larsson@actia.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3OCBTYWx0ZWRfX5DcFVvzI49mN
 aE2nR/EMoCF+nIvlfOKmP0WiF5AHkh3z26bOmCbA+jPMlcTldPSxLWmoOodBAbVlg2PXfp2dVuH
 Zk+dI2tMnuHHJjG00Md8mFH8kY2EDpCcziK+kVD5qKnDZ0mo6RNPsl1XZyIPH6pYMZDI9GkOWeK
 FzoMPf5KHE/R6jEIm1mxrbGjQy5r55/Eh6et+MYWzrggYonqNr4iQY6KUAyKaZnz6VhLo06FIlM
 n3SPe1V/lbvYCbsWA7nppJDgxgF+q4nmI5HHP2+2h4AwMXL7AELfezfRNjvB65uTxtO/MEIDUEl
 ab0Bl5SV7VhsvHnBDYudTdWEH7r8zd39jYm9ZFpgkE4wfOp8p7P6boNeqtiJOgHMtw/5WNvMd7x
 YosyfVWP+HpVf8l/B8PFr4EmwtdUXw43hAAuvWddo7sUfvIoN2FSPHlqiVVDTelLl8lLhNxcIo2
 RnsReHwmVTchSHn2okg==
X-Proofpoint-ORIG-GUID: 1gbIlult83rC8DOrK0H7Vk1tQ5uM9fd-
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=697886f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HvaImbMpvpopyYz4iucA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1gbIlult83rC8DOrK0H7Vk1tQ5uM9fd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31132-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0EA591DD7
X-Rspamd-Action: no action


On Wed, 21 Jan 2026 12:57:22 +0000, Martin Larsson wrote:
> In the existing implementation irq_shutdown does not mask the interrupts
> in hardware. This can cause spurious interrupts from the IO expander.
> Add masking to irq_shutdown to prevent spurious interrupts.
> 
> 

Cc'ed stable and applied for fixes, thanks!

[1/1] gpio: pca953x: mask interrupts in irq shutdown
      commit: b168ba38e82d354c4875befdb34498a94045cb21

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


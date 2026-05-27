Return-Path: <linux-gpio+bounces-37557-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLQmLAOlFmoOoAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37557-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:02:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 274375E0C8D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 555C73074795
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 07:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0C73CF045;
	Wed, 27 May 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM1Za8y7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+obiT6Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A453A3CF026
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868789; cv=none; b=Qufq5gN/MYZSB+/ij5SketI73YMAWigt94Ak3WF4hyhnznkQ+E4NNtphNjBkj6j8KyeWLeBxM4h+AH95OsL4VWleiT8M2fRcFzFgg/B2r7jBgKdOg6W+IZ7Lb4JQOBy7rxok6pXyqho+mObeSXFOX+fTxRUhmRZbm70AojsriyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868789; c=relaxed/simple;
	bh=kTNiuN+X5MpZ5JYS+hXYHbBrAwHQnd6npdpLaOFkfRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eLalEUpJqbISDJ/OuvouwBp/swMY+vwju+R/yt4kT3K+v9FNunXQnv3xQwfbRfz7Nf6Zeawnd7B7ABPUfgAF89WP/l4G7kDLWH/m800UhHvvr+E7FWTaKIDeAE4CWosYqTOp/BVWDbsbNQfqImQ1cxMhS/4gRUKS9kbOxbS6ee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM1Za8y7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+obiT6Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R6G42p1803459
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZObU4uZM0oBiD0PA/fhBGD2+qqPIChL9ob6IC3X5NU8=; b=OM1Za8y78f312cyV
	hGJIdLegDZFVQgFFEQ/lqtWkFLr5+L9KAl8m0rP76CAWK9mwiqJnqexY7bcG9zfk
	O/4RagghUO5rY9LHcuUnNEGkgPTa5VD9zafxoc07PmBe5UZ6RJTJH0/hJ4lcRkLT
	9vnN+i6oe5apbbWQ43gazfPFguwPSKNjxvOM+FgsNc68EbGYi5FG1nTTh8lNtNrd
	TwP1g9OA3XhropdExH479EcqRXtGRliPVoQdpwYFajjxFmAgUCjLTAFyHM28dsCI
	YQHk3PhShctknNqU5x9gXW0tIGJIgoZu+p/2Rb0uAA9Np8KiQUoSJ96/MpyUaviq
	82um7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgc5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 07:59:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d1a8a6c8so54831771cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779868787; x=1780473587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZObU4uZM0oBiD0PA/fhBGD2+qqPIChL9ob6IC3X5NU8=;
        b=E+obiT6ZVZrVipcgu929gHfP5CH3GTgFMaHNrjA1ii/xwswB2L5FknrP8FU67Agb5g
         7rDcvm0DEKp8eAv/mNl/ryGRHvzkTa+BKPbN8a8EJI8Jc0hZd/4ChDenGAhImyv3io7O
         LMfIBWDXRevMbtcg84VK0PQ+AAC5+0NepOf0qAiUCqbpB1sriMZpzzbIdxmXexbkUze5
         AQhZG87YW8bEENeBXiItiK3l/UtT/dNGb3O9JjmK0yli+B9nkoFfJk3Qrvjg4Cix9vJK
         AqTYRB6RcUzP6Ff2phj1jfqKskOpLXn+Jg87YKMk9NGM6jvXSUVFQyFoN/HJlra7JEp1
         c/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779868787; x=1780473587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZObU4uZM0oBiD0PA/fhBGD2+qqPIChL9ob6IC3X5NU8=;
        b=Jc+0KzWgb+MICbQjMDRmveXwU5SvA/00qcVeH8cTmfYtG0kCIK8RTzG5vQ1qj3nbgY
         zXLJnkaWcOivitFnR+XGzG+AeI9WByHaUGsa/8w4il2zgjtpA6gyVO4G9ErAEoPlC84j
         m8828EKk2pqvx7+RhEiVZNIV7BORfRcyKY64tij8BMw28/V1FfC8F7M9bJnstpiO/1zw
         ac+MLnd470U46JrhmzzJOTWgsnWPD/fGDY85Lzel8a+Ti4PTm5kYNrsFSEOZp/ij0A4M
         eSdtvXsLchCWpFfVPtOjlfzWxnW4TRb3RSkPicB6vbW4Q/78U6g8ZFTkZVOQJ5U7Zedm
         5/cw==
X-Forwarded-Encrypted: i=1; AFNElJ/opOJZCcd/BnQugJA7vxkC8hcYpwrSYANzi5Bi/8F3aEMSBCp1jzPZc3mtZzP97oZumFIKos0K+boQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+a2KOkgg0Ob1QzOONYKmWf/KLHqGl9M2InxcyLvnr5VfjdqiC
	VekqofvVgAeH7t7RlSd4GhTxwFiclX6eK6/Po7ENqm0lJaxofBSi/uleVqZOQGgMl8Ye+c+Ptn9
	IQmXSE/Jc9DwbUTjyJgmfur+vFDNNRtCggSvql0BP8ibxkXJ/X7J0vuZrPhm9XrV8
X-Gm-Gg: Acq92OGsaopy8Q5M+xyv60ge0M1w4mQ/oTav34YCpqYioFA61o8gCpB0JV5E27tezqv
	JQuDXz/fAq+7dQcC2Y2rz1kWA0m4pddK5J1WpWRSzt6gJGuoxItn51pO3lK/WF4lOu/lplEA3Qx
	revWS+MVrFNgokVk9MSHiw1CfLEJpGsHQQzikxfrhPaejNjePCx0Bt5JkocDCnQeE4olOMID8Hj
	HxqcuEEWPnDTfEc2NXM+yR13FTCaOUqbiVgKj7eKqH1A9TYSU5tjfZFjeqoukUCpnqCirlFzF3E
	VA3DbZNGFpFONxDHmaIbvlEXE+ZKnvBoAX6QkazKp5a+K9ZXYwgJhJnJsHsqeZ0bFkWvtgkiSvj
	BQooK0YY8fKdwN7clVoBeWdBMTwUcY33cV08IIDh5NJtGNcqo4UJp537ToeLnoQPD5OJGI/wPTX
	1My4RPydG2J28RGhnd0xKRRfpm4aHrjla0M15+LVtkS287PxrPmQ==
X-Received: by 2002:a05:622a:5a0a:b0:516:dcbd:aabb with SMTP id d75a77b69052e-516dcbe03ddmr270491641cf.16.1779868786888;
        Wed, 27 May 2026 00:59:46 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0a:b0:516:dcbd:aabb with SMTP id d75a77b69052e-516dcbe03ddmr270491471cf.16.1779868786480;
        Wed, 27 May 2026 00:59:46 -0700 (PDT)
Received: from brgl-qcom.local (2a02-8440-e500-3194-8c70-1be9-4d87-8bf7.rev.sfr.net. [2a02:8440:e500:3194:8c70:1be9:4d87:8bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm391766305e9.12.2026.05.27.00.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 00:59:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: gpiolib: use seq_puts() for plain strings
Date: Wed, 27 May 2026 09:59:43 +0200
Message-ID: <177986878032.4028.9942873809600019702.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526121905.46345-1-ku.loong@gapp.nthu.edu.tw>
References: <20260526121905.46345-1-ku.loong@gapp.nthu.edu.tw>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16a473 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=j0SYY4YQUj0_SLCMx94A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA3NSBTYWx0ZWRfX5Io6LdoRn6EG
 UKj5FS45utOI1HsIUOclucf2pniU8ZFaWN/MPRlTLjq1dpHuAf0Y6Ft+QVun/qWO3ki97jBBGmo
 hVd4CcI6UB6KkVMbJheayQ0OmvTxyz3MVEtzT5m3LhpBT9b0q5NVCYU+KVxl+h28Y9pIoayD33J
 iu+LmimchLxsGn5/CCrSXgd1Ou1HWyMqe8yined59nGrKAHjROkNnseo75MoE8NXHHHgDudNO2F
 cyBciFcdo5X79Z3dPPHhUE5YV4eYUyQClLRBt4n7Nkd4qQ1LSNEEPbhW9+Kkx3DvlrNG7j2bztb
 W+WNCbAg2RL18GmxtmSSuHOuwRV2raQaVnuS5ki+tkLG0S6apoAUPer9g/X4mpfnvnOgw2JHKWa
 kW2G4cGOIxxCOYbgrd04lNLSqQJDJjPZUTNiZ8B22j7FN9GTvesMfIwsCPzYiJ/jVl4VNk4cjrP
 t3VivrJ0AZFfNzCyx8g==
X-Proofpoint-GUID: ifBom4jeymx4KgypdG7eInBBJoOchJ0A
X-Proofpoint-ORIG-GUID: ifBom4jeymx4KgypdG7eInBBJoOchJ0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37557-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 274375E0C8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 26 May 2026 20:19:05 +0800, Chen Jung Ku wrote:
> Replace seq_printf() with seq_puts() where the format string is a
> plain string literal with no format specifiers.
> 
> No functional change intended.
> 
> 

Applied, thanks!

[1/1] gpio: gpiolib: use seq_puts() for plain strings
      https://git.kernel.org/brgl/c/20de1f993ea6ca9a9d15fe2e433f9e58841999f0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


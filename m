Return-Path: <linux-gpio+bounces-37497-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGu+LXNbFWq5UgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37497-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:36:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AE65D2870
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33CEA3041B91
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653D33CD8CA;
	Tue, 26 May 2026 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhExxbV1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K91qW2uM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11D13CEBB7
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784478; cv=none; b=fw5Z01aGACaOHlYNVQUCvZJHehGZAsdJU1Og0iA0LH7gCtfVT/ZXKy6IS/Ul75q9eiAKpGGiMShArp1W+TIm1X94XGRoc3NiHgTA3HQL05CClRnNOO62OS1qN2oVOb3OQWQoeko3nuTDcBDlSEFgBkpaGDrgwedLcPJpUCvMh14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784478; c=relaxed/simple;
	bh=V9aRg4gzHXQYQ76HkHPIB7aW2yTeFevIq1M8RFVJFJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVMkdyQeujuDGpQ1WT21yeP7Io5fEU7Z+fnMsI/msoXWYBmWHwhw2D3P9fNW/MMbXIaAaKt36PAd1N5yC2nQUnZk22yN/EFnag8JYAuAbqW6CbQqyQA3OOKdelFZl1IYsxuN/ixC91Kp6mlWM72El+5oaSwo7+J2IIfFbZv5yGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhExxbV1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K91qW2uM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xmkD1604591
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLtm52xCHMgolWmU+VREzSCSuG7mN7RCpDTC3+MMjCE=; b=mhExxbV1C2mI4OWD
	4xO5bl6AdyaH+PeV60jS3utMFYflUVGXsjkaKgwmMe3BehyxvrexnoQue2GtRxtG
	9NssHFRktE2JbwuTdM9VtpQP59Yz6iYns2qxxsOU1J1NirOnkjnj26b45RIi4Aun
	rhAbLCe0tRWso4oMxgQb/0bq0YqXIdoS9ggm1mASo14hBJsAK1advOE8C3w57o0q
	zifCG2mBChknaLHGYyG1zZ7f3YSbJtigpYQEguLu0uZJXGrWA961wBtXY+hVu1KO
	LnAIpJLLPwdu3+7Zw1G+QXH8Cc0rmP67DCeC2VG2aCM5uvqx67iqt0zQJa18GVMC
	mQG3AQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3rku6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:34:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so38579641cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784475; x=1780389275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLtm52xCHMgolWmU+VREzSCSuG7mN7RCpDTC3+MMjCE=;
        b=K91qW2uMoy/49mwdauT4PfbOd9xGI5vqzF2F0NCWU/3FkyoC0vVASb/OXGA5yGUE8c
         ddd82MSISq8G1AmZrZdxnemIuT6KW8wIthZwNCWByPrvwuMPk8sfQ6Xy6P/meYLhzujH
         roNxreHE3KSK9EwopZ/RpVjqFEnF8HSilwuQKtfH0Xjx4oADcCOihmm2R8NQ5QNdVlR2
         buySCBfmHUUPvyPjFhvcg4FIVmCS0KnwrnLE+bMe7gJxXIC/V+doy/+w1xflEdpvfB6g
         CV0/nHSxFIVl/8+gvrvamfYCKZW3S4lXa5RL59k+zbr4KM6mEFvFygFexuyu+kDBAh2L
         LTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784475; x=1780389275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLtm52xCHMgolWmU+VREzSCSuG7mN7RCpDTC3+MMjCE=;
        b=PPLCMIHUaJXNfr0jcEL9Ja2jSqm/nTTmRvXrM9GNXhGqlN4rOSn9UanQr7u4KlyDky
         Kzck482EILPOf9Eq5DPN7mmRUF4PVr5jWChlLZskBRsjfzWN1mWaGALbn4+eaI9deB18
         rm+xzA3/tsSKX4TSdVStRVyPGLI82qbKMqgS/6ncqc9bar13B0CpBEHO3tv17NTJ9LeN
         /ZrdDvXYa9FEF7dq5hFdlIfCnj/wavP2uEitfHF8HTceDYn7g8n2yvQGX3fbzprN9ocW
         IKoudmhjb2JFi5nEFf8TZrnXym5Fpil3Uar/E9/qQc0iKQEZFMA5jnjfn8I3Dw5go6zA
         VKVg==
X-Gm-Message-State: AOJu0YxJ5v1X04GWjmM5G0OHeifTWS2TjkvsNlFZLrQGP/7VsDAilc8j
	7RXXEmnE22QIUXAEG4ia+5U8dnvvv2u/PfTA9UlkTuKXrFre6j8rJrTrKKKvvEe5v7IR+lfLiEW
	q+NQjnScqchW+oKXwsLCPIV+5PZ/n5gRSIyw0OzLcZu0/Cv8R2u+CG2rv4I4DGDRIYDXLRStf
X-Gm-Gg: Acq92OEJys1Jo9U5UJHLqMw1rcYBoecD3KAiS/HjiI+ggSHhVuJ3st8Jfm7v/UqDesh
	/f0I5RAgaOvhcptEsn6g0rsrms7vTPHm1L9EquSGV4SHPVr8Tgh+ftmr4JXY31CEfWu8xGECD1z
	b3V/DOx3jyw4YTJVG4WMPUCNY9ua2p3STA2r0tqmzprMduPYSMedik0BVZC3s6oJ6GJGVefP6uF
	VMBvwwKrE3jkFunGORf/FoQZqS6GVC4BvvT5nKMra4LQVkmdBvL3Xs/M9Z6Jkje8uq9NJZ+9cWy
	2ZU5ik6Ap7tZd3M25OSbAMR+aLGvI5EhrscE/l06NUCuANf8IWNkUffPCtIe39zCpf3+KJC2m7s
	OqRUSJm+B1u+qQ3VlkekntmIC8TttY5JgU3c8e3A16hrFhoK2uw==
X-Received: by 2002:a05:622a:130a:b0:509:4406:44e0 with SMTP id d75a77b69052e-516d444f66cmr242436731cf.27.1779784475450;
        Tue, 26 May 2026 01:34:35 -0700 (PDT)
X-Received: by 2002:a05:622a:130a:b0:509:4406:44e0 with SMTP id d75a77b69052e-516d444f66cmr242436471cf.27.1779784474934;
        Tue, 26 May 2026 01:34:34 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048c6acf8sm92904325e9.10.2026.05.26.01.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:34:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Vasut <marex@nabladev.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: shared: undo the vote of the proxy on GPIO free
Date: Tue, 26 May 2026 10:34:22 +0200
Message-ID: <177978444193.19212.5319068808664522535.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-gpio-shared-free-vote-v3-1-8a4fddc6bedb@oss.qualcomm.com>
References: <20260522-gpio-shared-free-vote-v3-1-8a4fddc6bedb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfX5U1iQeVDmTZB
 /a2bVw+eLa5+rtjnm+dMlMIysB/W/nfIeH2MlGLawaoPqLG1GP4Lj1NlV79wdCF74dYJOUMnTlw
 D3Wpz4FMEXy1UUBkA+Z5jv1uy+9YTQxUtpXuIsVPmWSIPLb5e8ZPC8Bx4pspb4oy+PeTZ77CGo3
 De00o+PZSbz2ls4avUs+B4kYdbxHMgR3aokDik6CPB2pYnoJaYAvWeA6Q7HMecYACfvwevxK0rQ
 POv4OjZddy5PDOoj3MVIkKhlIjrPEoGx+ToaPHTcCTRE0pxqpcl2tAjDZ1X2By04uzjkKRW2Dqt
 greUEGpYXs5G+p5PNR5Hb7nDcieEt3vA1Nmc7rhzq0s233h0tc4J7gJRiqzYrDrb+9+SrzKqweZ
 os5k6Pi5RJ4+cjePSr12R0aRuQCx+FHuFjtap3IB4yqkb6XgN6lOfP8+LVKMcPQvi+Sjx7OV/KU
 SoB2bAF9Tj1PJQjPTxA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a155b1c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GL7bd0rghyH18HNIpw4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: bsMnHoD9R6l_U1S_wczH_fD2IC7PPgsY
X-Proofpoint-GUID: bsMnHoD9R6l_U1S_wczH_fD2IC7PPgsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37497-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36AE65D2870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 22 May 2026 09:49:35 +0200, Bartosz Golaszewski wrote:
> When the user of a shared GPIO managed by gpio-shared-proxy calls
> gpiod_put() to release it, we never undo the potential "vote" for
> driving the shared line "high". In the free() callback, check if this
> proxy voted for "high" and - if so - decrease the number of votes and
> potentially revert the value to low if this is the last user.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: undo the vote of the proxy on GPIO free
      https://git.kernel.org/brgl/c/54c2855a8de1fe135df5c1baa953d8c4d68198d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


Return-Path: <linux-gpio+bounces-33464-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJlVKgfKt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33464-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:14:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A613296CD8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08D1A303457A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A804A385534;
	Mon, 16 Mar 2026 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgqNwH1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4I3867O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0915FA81
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652295; cv=none; b=RB0903v8PlRpYHRwtvZ79yiE2LmgrED8NusewvNPDQaCJUqcyyqmPEBULcp6EE9cPfaDG6PwpoImFTWF+9zba7RNqAT7VANNwa9BBpx6evtyBCPNm5ggtHnhxyltvwQR30XLmyFptxTlmGyfMC3iVnyOk8camICZr1GvuMkDzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652295; c=relaxed/simple;
	bh=T1Cx9zxY3Z4AoiszyrllXfRYRD0cSawRw/LZ3ZpgMh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etO/Qzv23S6+lAa4cSOWdVYsWl40612gfWFbcP5Bv/VurrZ6pc1ysF8MauxKDrT159GJKpAJ8gQsWlNG4xWEKWEjMQnwfah8iS4TBzwIZ4xYhupY1+hHpgiYROxOKTLRfHkpm1d3a4qDCWQYat+m5bCzXR+N8cQT4CmCOAWpsiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgqNwH1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4I3867O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64tkG539830
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZBcNZLOunmA+oBT1HO8d0WaBc8LY0C0uQUKCgo3fM5U=; b=PgqNwH1cPNxjUn/g
	S6KBgCeOUhVa1auT5NqxBZtvHqWCsN1QGdoyAeAxOXfW3w6ldL5XkxHgmZdhJKVY
	1uXuQO+QiOJWDwkDx4HDK24tyrONRluTGtn4NnPoSL7AUqDS1+AWsXHO1tTMKIgd
	MiIJsx1snrLqmLfNySLyYTpufT6em+RMdf+GMXQdEaRlCp7eaPrI58vr1NsgApcS
	rRNg4wnD5tx0sRec0KGA11iMl7fV7BgoeZp8BOLquL9vuPo83G3v/dlqbS1q3kOv
	cVwcYH36oP9sRHjK+AzdRDJ0kZFx81ShT2anGuC/kNq9f4AUOu5W06L59+hETjMZ
	VQhINg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5mxx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd781c0d90so3134286085a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652292; x=1774257092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBcNZLOunmA+oBT1HO8d0WaBc8LY0C0uQUKCgo3fM5U=;
        b=a4I3867Oil+7KykvsCUvKjhUxAf6rsbmxjUhn3zPA88mNuIsOPg401HJi6HcHiEJ3V
         G6/NAgLosbTQfURWvkZAt+HdacY4FnW8ol7vYKB/nfVgSjTN3pgaJ8wzlopsL5dRV1Uv
         gH7loDFhrPfxM2Ge/iuklr6X0do9leM8zB/awJ9SdAHEsYu74DYfikCewe+wO7vxZ92T
         6YJTsdWnZ0qsMnqie9IuxQnzuOmZI2aMWvWWd97GVnyS/uZ5WHcwgAJE6fLqIAvksW+l
         4SBXlczGV6uY3UUhG5fFhSgbZ/G0bSBwagmrAsmWw+vgmPo8qpqJEQVClaRu743ZmXQ+
         Tcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652292; x=1774257092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZBcNZLOunmA+oBT1HO8d0WaBc8LY0C0uQUKCgo3fM5U=;
        b=OYNvFsR4T/SmKc+q943DTdcnKjoNnykCZqBUYSFolabSBFywbc7NUfCjJ6oBz8vkhd
         lpt/Fb3N2Ajs7rhJCT3NLZwNxc9fmHB0UukNk73gVgrefjdcVvKz8nH/XZxHCBw2AmD5
         psXGcH39rh3zE+ggrFdONhR0dC2VLZA87yPnmBjTYxYxAwypEnkykA3IjbUm9hjBN6cp
         dbmoSvXyyafVKWy/sEdTm2Hu5dD4SfVethjfr9xTH62i72LtmZDLRal/TdR6E98528n3
         UiW8Vd3OGE80smASwoSa4Z8iEm909S2fEEbEiiTxD5FewuusxfrtS4b99ziKsVAwrGRV
         mHfg==
X-Gm-Message-State: AOJu0YzpHQYItrmgQCv6UYNEIn287vDXkxnii0rQam35W1ShWHcTA211
	KuI3xmtXjOklsERp6XxIsgT/l/DHK0sT25FEtE+xdy9JoF8SbFvfq/FGsbVckPjhDK2f87TjYQQ
	7inRXvHAL39YgPMLwppT89bDe+pvp0oVQ77xZPTqw/H4Vqm1Al0bju7aZNr34uiZpDz5nUobw
X-Gm-Gg: ATEYQzyoXjT7GrTEtYguJjhKCrhc/+FC48VJcUuhddPAKOmtZmRC2lnwcroOgHS0D2w
	oVj9VsDrugaRJ3Mr7ysCGsb8GbcxjGOOMR8iMy67thS90rfqla7O7gyfwzabjMs0vOFJ7ESYRBV
	K6nLxd5o1/3se5ajrQKb6OZHQDrBygp0s9xdawF+oov8VuJSvqp6iZSgFylpbK6/IwDUJCbXWm7
	+OGbE55bz+xeCJnkJqE436HsVD/Uw0vNtDfB4zbiNWq1vOMG9h6D/4NQm2PHQKK5g2TMaS8VluO
	wk+XWlwRS6MGo2sweB50oXsGQj/+uk5I6sEWydlxjMue5FuZyN5imlOt0IsT5XOn4y1rmxOQH7w
	QpPFZcek83ymuNVXvUB9SuMYJB4zK1D0VkwGtG8k5IUeCtinbqb8=
X-Received: by 2002:a05:620a:4709:b0:8cd:8fb8:7ddf with SMTP id af79cd13be357-8cdaa7b63f9mr1963839385a.16.1773652291793;
        Mon, 16 Mar 2026 02:11:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:8cd:8fb8:7ddf with SMTP id af79cd13be357-8cdaa7b63f9mr1963837785a.16.1773652291342;
        Mon, 16 Mar 2026 02:11:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2932198f8f.12.2026.03.16.02.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:11:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 0/4] gpio: kempld: Support get/set multiple and interrupts
Date: Mon, 16 Mar 2026 10:11:19 +0100
Message-ID: <177365228186.54363.14243600391082440879.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
References: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yA3_e1xm2MXrqqaam-movHUWWMEnBX-k
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7c944 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0IMggjnZZQ0uJYdao94A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: yA3_e1xm2MXrqqaam-movHUWWMEnBX-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MCBTYWx0ZWRfXy+QTiFbyhyiQ
 iRfDR6tdx3flScoVcQnHkMlLQKuirTU9bUhyPwQKgQpLIJ4AK89c/SZCr2HNetq3WWeQmvclCXW
 JZF7vPJLDYnWK5wBEcsn2bAXNhuiWfMjUXHBFsYd3t+d/nkLZ4PaPytNOVbS7dVhbqEdWQavdNw
 29R0VgmBW69qsOU+o96pw04tmg+ahqwIXSDE07hNo9Nv3/GLG5JJKU1Cuf981F6yu1vutv91gAW
 H4Vj/pvZJKlv3HiY9EAwPZA5m9heqb8Gh6FWsJkK2pjAL+2qQNRBbPOrjon+dTmrQB+pWUAOdsP
 XxgEKQu0ZV/8AZdWQP+nwMpWtdCreLRsWyvgoaw2xspGp7mkBihOlepGJJO9BuOtdXbna2M1L3I
 ZxzmdnyLeYxv42FCMImqC1bvLt1jMnotKLkJGEt13MSFNh9DdP2bf1bkQ/tuFIjP1vM7kGobV2t
 Oidc2P/l9sU+6TfCJ/w==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33464-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 0A613296CD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 15:31:16 +0100, Alban Bedel wrote:
> This series update the kempld driver to support current versions of the PLD,
> add the get/set multiple ops and implement the interrupt controller.
> 
> Alban Bedel (4):
>   gpio: kempld: Simplify the bit level register accesses
>   gpio: kempld: Add support for PLD version >= 2.8
>   gpio: kempld: Add support for get/set multiple
>   gpio: kempld: Implement the interrupt controller
> 
> [...]

Applied, thanks!

[1/4] gpio: kempld: Simplify the bit level register accesses
      https://git.kernel.org/brgl/c/4071437cd2aac6b9d48f160d46cfb35ecbb11136
[2/4] gpio: kempld: Add support for PLD version >= 2.8
      https://git.kernel.org/brgl/c/84cb463d2f6597c7951da6fb795f12119af8130d
[3/4] gpio: kempld: Add support for get/set multiple
      https://git.kernel.org/brgl/c/2443c2e1223bda4dcef5563d0154df6a72969922
[4/4] gpio: kempld: Implement the interrupt controller
      https://git.kernel.org/brgl/c/a25f48fd920b557e6ad02f692f690520c82f5914

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


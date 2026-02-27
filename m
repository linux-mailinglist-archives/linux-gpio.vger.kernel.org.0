Return-Path: <linux-gpio+bounces-32262-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LZVGqddoWmksQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32262-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:02:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE351B4DD2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64B8A309E7A9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 08:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE163DA7F6;
	Fri, 27 Feb 2026 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrF+BhxA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frSY+1yL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25C3D3D15
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182748; cv=none; b=GCLQvE8m8GBnAnKZ6POaTwXj3t9HZmNRjOswusY/2sYDYTlGDz5oCaZjNGDnE145sL40J+QiBJzYbIDdZK2D4+QBxNgFEZ6lX5yu/SbrL5lYrDiC9hJDo5F+TQXcENpRswLRsuo4afqo/EAT5f7pXYUP63QsDpgMn9LFV7aXhM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182748; c=relaxed/simple;
	bh=W98YmnlcxdJu78mz2ROLgf9nrFeNop26078sEvKQp5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvlCP+/pxObP17vnrWW/SqNioo0GAud3/lNmknQilPxNnZRGPWwZV9aAdD0Hmdvfy6sePvQuo7CE9/ewNqShL/eaygT6LWKRVEA7eKiHm++996xEvWftN0QIQQREangHj4RoSA+0Bb3yQ0SDDAQsyK0j6FQCKYXYJ26w4ZWA3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrF+BhxA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frSY+1yL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K0xJ2982304
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v6xs42QTfVb/BhS8igr5/o2crb26qmYlSaN16i8Td5A=; b=DrF+BhxADLmmPs82
	KRcWuo6xkNpQiqslKe/w9LtFzjm/DUFSjJL3+CHHfaUdJNDJcyPOGHqYfoA+Kmo0
	iwrKvuMc8N2RjJtb5F+lvdMw1pyVP7W7RICCweE9wxyq+raMaWdP1597mbrohLWE
	XTHw2nK8VTY3QYWHyIMcb2wC//Q4Sh5ljhodhXqwLz+K7y07KQ+d1r0T/cyg370S
	9E86+KeQxYiARphnlQB8EsRnARU86gZeeMUo0U0+g+SsOMMHJj6DjdkMaWhi2Z/2
	tDjSVz97TicJlzb/T7BElEfhUrGJIeETPBnZl8KrX7EPs46dXu+kPz5zrI+WCYwR
	JmH7ng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v4f23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 08:59:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4e37a796so1275925985a.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 00:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772182746; x=1772787546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6xs42QTfVb/BhS8igr5/o2crb26qmYlSaN16i8Td5A=;
        b=frSY+1yLLtcSyr6pFewKtDTP/o82wqnN1GLYfQTuECI5tE4t3Senhth56hCPTw3ALN
         iU1xxF71U/NCFRAArNbj5Rf7UKrkj9rL20q9V73D0fmP5C19Fo37jlsQNvATbc6Z8bR3
         nh478VqpnFeINGpej17MBhDNmZNUqA03kSsjPl7Y4HlVksQS/CXNT69pbGt/TL7bFWNV
         Q3CLaZUHyFx8OgD71UVBHzj/Hz3h3XwiZVKXsRMpPpYb0U+S9de17WYv//HhUnRR7eRA
         FAsdSveuac9PeBUb0In+UqqQIjRPui6H0yck3g489CXL4ehZxvgYalEIOuuDEi3ypf9T
         5N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182746; x=1772787546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v6xs42QTfVb/BhS8igr5/o2crb26qmYlSaN16i8Td5A=;
        b=MFV0hWfvqOsaD3exMoVexyaaBgY/J6QLOWDBJSt4hDMLS5qSmNpygrVE1Ycgxv+W3b
         SvsJCgUtUSQAW3nRq2V3PNEaolq0I/tdldnlv6ZcZwDWI1uTsUNt+2oyDMjoPdr277kF
         Zsl1uOCLy0ZuGyfNEdn9cM6HqOFgLmtCotX/DndA+XkSTWuiYOhH2T50LEnJE1BqBBVx
         YJKfFEFjIM54uSWx5v6HS6dGaaRur0q/pjTjDIyXSB7HU7gbxQ0YZcJqgimR1wc+YuN9
         LIcBoffINKb5uEhJI61r3doenmw228KyO1d0a447Ej/bg+ZXkqT0SkVIvZZxh/8C90Ck
         XT9w==
X-Forwarded-Encrypted: i=1; AJvYcCXJM9XyfEDkT+Z5PpWnwxgPfwx/0U/aj/C5VMY91Hw5IUoqa57kqy/kuO6oanuZkHz0xIWcfbsnmKbL@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZtht9BaSrQsNhJLu2DfRSSgjaH1fgIfPQ1VWSazAmBXy2aEK
	F/yWzY+kzIfX/0SFzNYifuxWnQ2WOPhnB1RFoBr1MWfBhY/NRAjim2ZEGYRvi4qG1GQA5bRy8Wb
	VPKN84VnJl/JyIhAjsmDlXwV810W3Ns5QSG0Wb7pcDOqZ1BUinJ/0NIL2bw2p1thY
X-Gm-Gg: ATEYQzximMrSAhXdaZqnoJ5lVtLCBW/drmDpLYMlq/ORK2ik2QUMqGboOYzlyeapslv
	UE7RXkKyC957bi1RlfPORY6zoFOUTKRz0/oQtFaMhgGWz7ClPQznIEyRIRWqKl0BlzvRwqBtu36
	T1zjcJHxWqvYZXXXsoz5wSlOATuSXr3yV79W9Ehc/CjM5OAySCh7HxEpBUdpbx+Dn2byofPGKWj
	S1V7fOgqD6JTCbZNMgCmiyZwDma+gzB/xG96U3oGGpxVnTlhMA0fO6Ab9nrWQaxirdniHe4FO8T
	K7hv/HSY2Izzx7qps2W4BBpcBUXqD4vPGns9wVIZD5Zn/DCPrKtp6h1fxd3k1P3V4L86xDStg8m
	ZYkiw3CRrda3v0LxaghlSiq1Xg8GkqdCCCo0IOuW7aG1FriCVcOs=
X-Received: by 2002:a05:620a:4505:b0:8c5:1f9a:6b52 with SMTP id af79cd13be357-8cbc8d86ab8mr224821185a.28.1772182745650;
        Fri, 27 Feb 2026 00:59:05 -0800 (PST)
X-Received: by 2002:a05:620a:4505:b0:8c5:1f9a:6b52 with SMTP id af79cd13be357-8cbc8d86ab8mr224819485a.28.1772182745158;
        Fri, 27 Feb 2026 00:59:05 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8bcf:177b:d085:ed57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd702e7bsm224129855e9.5.2026.02.27.00.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:59:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] gpio: generic: Don't use 'proxy' headers
Date: Fri, 27 Feb 2026 09:58:58 +0100
Message-ID: <177218264416.8055.17554690620825926652.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226092023.4096921-1-andriy.shevchenko@linux.intel.com>
References: <20260226092023.4096921-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8Si_BdmbQPphboJHIbVzyYjLLiXxJNFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3NyBTYWx0ZWRfX9v14hK0K/FJE
 vir30kkWo/edECdvqjZQAVrnRzmLV9agTN2Ibq/WaWGZCpLSWhXk4TqYbLajNGdGKz9cbDM1kSR
 c/A4fmEI2uRPaiZ8BrXFAb2mj+kpM5B9uTYkmYFpnGgv1thZW6YEyiTczc4sNugmlm/H9AdtGkQ
 9VtRp1Ox2FdwSoxohVTG1isWf+xFPYRpP0IBM9RICiZbEdEqMMaTXBfJzq9JyLaUFQke+fX88sW
 hE8xcmdSP3/9WWMEDEOIlLmAOFb/VZcPsXoplIgnXJk33lncmgIMk6mFJrjFo5XMd4Sb2lD17LY
 FH3hHj3uFGjsGV3Ex2UT/+87c8wz7TaJ6fCr5cavQLHX9Y+jJ82S2CeW5br/FeIIGIOEkUuPw59
 e712ToGd4cD3zDusaBOBol9zWVzTVmHo5+YYv6KgA+FT55b6HLHQ82HjfFBnHRTbnWOTSUDh4+S
 svynEepecJSgestUenA==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a15cda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xJyrDkSYr-fTU3u3shwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8Si_BdmbQPphboJHIbVzyYjLLiXxJNFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270077
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32262-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 9AE351B4DD2
X-Rspamd-Action: no action


On Thu, 26 Feb 2026 10:20:23 +0100, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> 

Applied, thanks!

[1/1] gpio: generic: Don't use 'proxy' headers
      https://git.kernel.org/brgl/c/b2d51bc1601c762c63f19c119589a0a0c44bc8ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


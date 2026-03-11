Return-Path: <linux-gpio+bounces-33083-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C6sDZMwsWm0rwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33083-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:06:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9F25FF92
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2EDC33DEB17
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 08:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17A93BE147;
	Wed, 11 Mar 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0kUWn+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rve8oArn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6849F3BF669
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218783; cv=none; b=Xa3W3XQCn5q2fvGUufe3vaAeglOkM07tK1VM8acioCHEiea6Pn+OmNE8Oqg9V4iEGaVSLw22BBKGyOhcPgHCqyLbHb+3y8KqTEAmnqeXqdNrQ65RF1XVRMKl4fmR531PlSTs8nCE8jqaW08xNSu60YqJ1O/GOemyRR+6Nam+MvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218783; c=relaxed/simple;
	bh=KcBBn14EnBGiMW8fGtck7ytZ2j6VGoFJsjejrPDO9dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/RFY178ni1TZooJfuoiYk0DiBUHyjbRjWqZu/xbWPGX+IUqZX5v4CKlZMKTr6L2rg2zFpny/P60gyO5OJGliGPLssM++OFx9j8HDaswMW4tYPW0uGuyPUyKuuKb2aBJMIR1ktXz5CULild5yqYjSqa+FFoVSmU06s5/oaXtJUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0kUWn+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rve8oArn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3VA9K613996
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	unTGgoVWUMk5eUcsaRXhcn5zZKpeq+dp2FcR+QUVi+Y=; b=C0kUWn+ja6EKnfEx
	Ssvmi54AlnPGZih4GO7YQACwjYf9gev2XJpKmjNg2LLTkAi8Gox8skH6D/q1kbfH
	YPM/YlT3mkJw0ektRGRg007ef/Pg2iZX+76EXpnLr0W+vH+2gd4N5CC6P0d+emfN
	c2j9ZEwfLeE7/xHkxT7BJl4uFsRXezaDfUws3gXQ9O9SRuzvWYy/rNUEnuNjlLlv
	oUxjBc7UGasQ0n5pHD+rIyvs3ccTWW6e5TSViibc20yDbxcP7/Q7DLXbq7BZ4wNp
	y6fHzeD1OaP7n+l8CT2MgDsVSBWB4STALBCiFmvY5qVtjvCnoLu2UBkx2AaDPqnK
	q5yNZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu0jf10fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 08:46:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd409so529838785a.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218774; x=1773823574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unTGgoVWUMk5eUcsaRXhcn5zZKpeq+dp2FcR+QUVi+Y=;
        b=Rve8oArnOVYj0Qb88em0r+/gohzm4kyn2E8PuUxJnq4fCySScbni/ft/CaXP/Bwc/w
         UuWFA7RexC/DQvY5DvmGE75MURwpbGR2HbeQoq9JRHWUGQT0QSWjzb7RD0DbnNHdEQF/
         TzlZ2rI5ncn+yosop+SHFvEywReM7JdTXucstj36AF2dLGEEZ34PkOuLoBjETha6S6b0
         URjpdKArznyWxTZ8e5iCu0fizHAT8ANOWWLluhGvHUyu25oGzBuzBdGCv8pi7i3psTa+
         y5AiO9qUQC7ZaImTBac0FroEVW+YFAKpimUfvIOevJORZCGxpahCurU3n/0qHlHRp3Sj
         4K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218774; x=1773823574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=unTGgoVWUMk5eUcsaRXhcn5zZKpeq+dp2FcR+QUVi+Y=;
        b=NNoN3GusZRqN5muQNX7cRliQMSrbMPk4Bwv8GliDF1o3zK3p3/lHg1UR/zuyfEojvG
         AVRYRPQnpg7eyNjMVIVqXpzhxGHM7WMRFUwX8PneIP9pv30E6eVPzLQiDnVBpHth0FWH
         WM4RJL1GfafOLvZt35svKxSb/HoaE8Yi63lVUSuvzK9Gsuv59vYj9LRO9EpxcpMkkXW8
         wGUD0ZzzuCOhPQGyDFAvQ2c3EHLBp35NP21D04L65NcON+cYDdmr1Qg0PebtuVN4XOLx
         /2vqeRKMCMwpiC/4fH2Nm5zPIgail8JHpz9RRqW/hY7Acgti3t568jKMaNysCqBusOXS
         SehA==
X-Gm-Message-State: AOJu0Yw7UkVqfkLCUk1GFpqJntAZSCLNHCTiTFp8/e2v0J1vWnRCBGAk
	9NkJjAE8ivqc759go7tDaDunEXbBhqDb/hVUuZQmEcrawpMJ94uSfplKOGiGYJPaIaUIcg72Z8n
	+1ImvGDnenkdwO4N5JKhPigDMjr2lXqOJ5EflaF41bg2Tv2xzjWk8lGnc5ztO4F+eYI3KaPAb
X-Gm-Gg: ATEYQzxh2rHrlBBkAEheIu9IO5yBqlKkN6b02DhnGKEfEPdUPw4wgN9U2HORiOG4i6v
	GPq76FEhuyMqTh0fEOkfNLe4ddoSQ4kI2D21BAN3T0dPAmXO72eUDmZad/z3LJuGZa4LpVUNJJF
	HO+AaAPYOGkGu/DZ6YCARw9+Dg9SBY2NdsD4QhO+SX2NQ2aNKfg4CUGbPxUAJ3NonB1kRK8QD92
	BZKAUpn/LdoO51n/s9X6WwKXXLs5f+GvtAl1pul7jB3RpibriRK6/ce3Ax1ggp1PxXzgLtB3eAN
	tWQnBlH5GIdtBxW9VFLJm3R6D39l6qd+ihJ0NVnSE6x6gqEeMb0XeOMUluu8SWE0UJVSLW6NoZo
	EWrKQUSLo6wIq0Vjwv5UVzfxYpQhZyNqENcUWZnEE7gzFHuyh7b4=
X-Received: by 2002:a05:620a:4009:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cda1955188mr216964385a.21.1773218774476;
        Wed, 11 Mar 2026 01:46:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:8c7:a53:4d17 with SMTP id af79cd13be357-8cda1955188mr216961785a.21.1773218774031;
        Wed, 11 Mar 2026 01:46:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1f4c:200b:aaaf:c666])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81fcd65sm5503816f8f.26.2026.03.11.01.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:46:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ray Jui <rjui@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] gpio: bcm-kona: remove kcalloc
Date: Wed, 11 Mar 2026 09:46:07 +0100
Message-ID: <177321876119.6763.661602970741238772.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311003431.31881-1-rosenp@gmail.com>
References: <20260311003431.31881-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IHi8VJnQUdY_v0ynxTX2HJ9CoyCfhZIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfX91n8NlTvsqhM
 KZ9qPmEblIrIWrroMdrEC2FJuJLv7sRSNMKC4Ndak6fUO97c37ZKu2GiTpx+FjdyHXniZlBVEPi
 7bqqa9lpH846Kiy77JPUE1/byJ/MLUynlhEjqG0+6dHF9D8mOpAU9OeETis6dsuuZIVOwkdBxfB
 CWxgYyWCXKxJl+mSgc3HoijesA6Mmcl7hs8tURG/PTsJN59TrRZT/qXmCnfOtzkNa7XKYGzOU2v
 Zjdk8/hz0Oh1Ov7tZNP6MK6fJVIaYllXkHJ/33+YYNNhPeJb9r5WBcfOMVvvPeyJ7DggGMSF98C
 1oVeixCjNHulWBQTp43Rnl0j9EH7dPJYikbhr12WsR7vaGzxPO7N3Ek1GQmkfZumxKU+g+VFmWI
 KBFLnU9C4q+D/WZERwidjovgFZp49zqZKZaSsM9IZvVoQYGoKAax5leQPGRFb/2K47YG7yAH2UA
 pzuBm2uxOZhpnJG8yRQ==
X-Authority-Analysis: v=2.4 cv=FMMWBuos c=1 sm=1 tr=0 ts=69b12bd7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1LwNWVZHs5xAXWCdWcsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IHi8VJnQUdY_v0ynxTX2HJ9CoyCfhZIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110073
X-Rspamd-Queue-Id: 7EF9F25FF92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33083-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Tue, 10 Mar 2026 17:34:31 -0700, Rosen Penev wrote:
> Simplify allocation by using a flexible array member.
> 
> Use __counted_by for extra runtime analysis.
> 
> Shuffle some code as __counted_by requires the counting variable to be
> set right after allocation.
> 
> [...]

Applied, thanks!

[1/1] gpio: bcm-kona: remove kcalloc
      https://git.kernel.org/brgl/c/0258fe8721f541bbd3949cac2f4971b98e1fe4ed

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


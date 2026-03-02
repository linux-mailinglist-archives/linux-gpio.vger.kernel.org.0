Return-Path: <linux-gpio+bounces-32390-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IeVMIZypWlsBQYAu9opvQ
	(envelope-from <linux-gpio+bounces-32390-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 12:20:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7F1D75CA
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 12:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD70030305FA
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 11:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88F836166B;
	Mon,  2 Mar 2026 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="czNKOS+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PijWWGPF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606FC35F8D2
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450367; cv=none; b=dnutcQD44yKaUM6QPbWd9HQAm3AF+HOL+KqDLCUZglFM55nTaKH+wurXEsxJ4ByacvnS43zeYUjjWwQ49y/aYsl86hPuFzF7OFWArInDh3qWyntNDHoX2UxOC9NexlLQvsg3zUM0kaijfOispVjgpA0f/L6YXgI/emqHwTiJoOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450367; c=relaxed/simple;
	bh=iHs1CuzVKiSBmf7CzDK+gy9BGBkpucY4Ug/Q8jyAXRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=riyMHcYMrgZXobu/HiV6A3255EUpRBzPiYGXDqflkvYKM9VuwtbJbrgdPTu2q5tpE80thq5qvYO5QEv+Ns6vgWsDyEL41441WHrZnVHJejdUCIPdJ43hwqeIIekDvxRTjN/T/3UZ/mmiCB5brTKA56fGhPv6e7ctJAuRd6cXlEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=czNKOS+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PijWWGPF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622A91kj860810
	for <linux-gpio@vger.kernel.org>; Mon, 2 Mar 2026 11:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jU59UoUEcYMRRO1YNloZTfAQbT4KA8fo2g9GJxMzCI=; b=czNKOS+4Rh9FCeZP
	1ieirHNF2R+dwMAbva8NFK6delTpNr7SK63zriXrxaJ0TFQRA4pfkcNkv7RUszD7
	Cm+jyrNNBMlvsBUi2Y5Zlh3gQBivYCxgcbQfOmgwQkmnQS0UXu5YxC+KTR+LkZHT
	OIH2gqT1ysVGdJ3bQDTi4LatS01U5M3yR8NyTMiwFgkiUQqyBCtA9g540oOOfmDT
	AYxfx53OOr6cTcukKIFmOLQWTw3/yFgZntTxI47+07pEL8zsQndAJXH9w+zDo6/N
	5AGHrSPrjVhy+fDBptBiYs/wEVgyRSrz25swtxvpvwzdjphhQxUoDqMNE2ptR9aB
	UBMzZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbau4hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 11:19:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb37db8b79so3531907185a.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772450365; x=1773055165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jU59UoUEcYMRRO1YNloZTfAQbT4KA8fo2g9GJxMzCI=;
        b=PijWWGPFae4f59VumxgWYGX3kUJWcDuqOGurP4sKLFbHh6NB9Uw0zUYb95+YblNHRW
         epgn++aylS5BrNnjwm1vrBUmvoY/EML7b0dsahuaiB5STsXLdkPfmWNpUCbl5sCg13jW
         obrJPieTtJavhse1b9xIVcfIx3NmQ7RaOW2tVjIw+x6rcEvhy09T/QiAVEeUupBGKgm+
         qOnrJqlUKVFLHl+jTxaqjGZE5m9xv1bReWHsrMtuNs45xS+LjO4YM6hUWBbMAXUHR1IC
         c3vormnwDOdJ7+1zg5s0epIsTAC7OYn4NLYIBcvoxX2B6VOXEegyoSnWWai6x+FJagIR
         3Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450365; x=1773055165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jU59UoUEcYMRRO1YNloZTfAQbT4KA8fo2g9GJxMzCI=;
        b=OF4Zu8+sTOYtMWvJnY1wELqKLAtwGaiapNxzg1QI/oFRuHjmgeg2+HGqwTNrHP+DIn
         nvHfh9cDq4usPeO8yzFy3uklmKZUkKJB2JovnRu272IwVuPd5ZSJRz3gcHAGI6GEwqjl
         4QSWjxEOmdFN/Z8rUx18LyP6xQxgGmX7g7BCvHU31989nIHLyDKRPBUMXjhkqRWzNoUq
         Q5JKMq3L/Sn34ZWtq5ojcivB0ToO6Jo72n9rN4Lq3g8wN9EB76K22p3vWVT3rH5MEiFk
         dZAerKAJvmHKGqFuaL8XkSdLS+vPculAca0dcplQJMC8f0LFnFpROGQMBoFl76IfDXv3
         dhxw==
X-Gm-Message-State: AOJu0YwXc6Ho+UTCGEiEnNkqNw1V+hNdubTv6N/yKvXqXO3aLg6usv4f
	ZYIdJQZPwfvhpxPAxwacxUmWF5YfG3MSCILJkVF5cnYJufopJ2CWHl9cuIu9s6m9yN6s71K0H+X
	EcfrDUP7dotgHXixAHMnj1Bm/i/TggR5Te6blk9bglSU0C671bMS2rZnLJtlkbEiB8r/KNpQ+
X-Gm-Gg: ATEYQzzwXDfa1DX2uvG+/zLILCQyiUr67p00R2JQfhzUO9e/pl+OHmb+/1MvamFt9B2
	Vx1FKqgmuEgGYjweY7fQYTjWKN6p/pis0H/KIkf3R14cSo6ik5UukXZFezcjd+N/RzSTdhtibvO
	YI9b5QM44gL1vy0F8g/7MSgLs63nkKPTPOLXfeJ5Ka4uzxePy/Nl73eJJ6ghD6kFchjz52VruG1
	z/crJUw8YqhFFuOzZ3GBTZo7HDp4P0ipXvFvkCQSDkOeUydHnrAwjc05vZCbKsmre58KHymRXR8
	NPC1kRgGfeSGVzmatWpOM5tip0tgNju2BwJQ9NvHpI0AXplO/B7ZCma/9NmRSRdFu7CIGFojY9J
	nc8yc05r5S7dULDOIJMSy+2sYJHLwHp3l7HX6F0JkljCy7Fvy3Y0=
X-Received: by 2002:a05:620a:711a:b0:8c7:a84:d0fa with SMTP id af79cd13be357-8cbc8e034d8mr1832140185a.55.1772450364795;
        Mon, 02 Mar 2026 03:19:24 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:8c7:a84:d0fa with SMTP id af79cd13be357-8cbc8e034d8mr1832137285a.55.1772450364391;
        Mon, 02 Mar 2026 03:19:24 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3aa3:6bef:50d3:48ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm423173845e9.7.2026.03.02.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:19:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH] bindings: python: remove egg-info during clean
Date: Mon,  2 Mar 2026 12:19:19 +0100
Message-ID: <177245035506.65351.7272154298016484430.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260228185213.31442-1-vfazio@gmail.com>
References: <20260228185213.31442-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MyBTYWx0ZWRfX3ppleIvxQuTt
 pIwIQNTwBOtMu2GGY8sHf+4OHk9gAucK5z8oDr1ExA0XIWKHfqjL5HnfVDYyBwJWjd4oJFRu38D
 MdvufV3S8I4O+Y47g2LlyAtjusUNsvKTeEtIucjWb4BDm3CtdagTzS+5nZ8jhHAiVS3xI4N8mtq
 RI/hGfuxUW4g9VsyZzaSm/msmzZzJgLVxIZOG4Ct8zb0xs0Nzvhv24duHBDRuPWQGAB2Oobh0Ad
 cZ8g/NDuWJd7vzHXvJOaYPn3KZZP7vnYreEzn8srw/aleBVBUeZi6S7vK5zoRaGe0bTIBRVF9PP
 oieLLK6ldJ/IZoleQqGsR+LV73xdQpD2VCQ2C1In2XTkNaCkHLg3/HsQkEt4gqiQc/sqkMirl60
 10wNYIDdEBCyZU4JNr8oesDPX0JK3P5U4IK/K7JJ0wpqNkfDBBW9zD1hf+DniIRxQSTOwkiN4i6
 YV73YrcqFyXwX3FsFCA==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5723d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rZP-kMHXi_ZdYjMEVxIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ah6egC-iqdpYzMq3HuqAPs6riunCRmtI
X-Proofpoint-GUID: ah6egC-iqdpYzMq3HuqAPs6riunCRmtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32390-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66F7F1D75CA
X-Rspamd-Action: no action


On Sat, 28 Feb 2026 12:52:13 -0600, Vincent Fazio wrote:
> The egg-info directory gets generated when a distribution is built so
> should be removed when `make clean` is run.
> 
> 

Applied, thanks!

[1/1] bindings: python: remove egg-info during clean
      https://git.kernel.org/brgl/c/ca20f1c3aa180b566aff1a72bf120f3306c15341

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


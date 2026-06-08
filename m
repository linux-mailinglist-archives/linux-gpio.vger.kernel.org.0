Return-Path: <linux-gpio+bounces-38075-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wbr8OmB+JmqzXQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38075-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:33:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60507654167
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:33:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pYhTNbVt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S4snrmbu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38075-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38075-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9928D3149175
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741AE3A6B81;
	Mon,  8 Jun 2026 08:18:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143AA3A6418
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:17:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906681; cv=none; b=LrsBrMkiWoHdXoKlM2PBfDOGOJMwqNlMXUvUVCX6qyTfx1l+JxeP5PiIwb5BgSeu9ws7oAAbXBEvtRcLtrdigmx32WTPhGNqVAJVyKNIeZw6x67Vn2X4KRZZznmRBK4pAhvKlDK3MJLogqqCBaBvvLE1+DKsyFo1/FC5XyKB/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906681; c=relaxed/simple;
	bh=leSDceCvPagcLYliTVOhByJ7oyoNBEO4QGAPtlznbXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=afXtC/VkDeA0Yo3WHHnTWDdCHooq74cTpaut4EnEzuZAKqcotvR0QGDbi8f7a6A/712WqxtodavHRV2+DvZp7m65Ui3oxbEGJegcLh6pqNM6lO1/RjDb4tyaiOTaE9DJ/YCVs2O2KGW/ntUY1F+vAdDZ+xEExDHrkPhMrsAEFoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYhTNbVt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4snrmbu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkQa2382814
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 08:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8d0/4vXEmooPSaDLfa5X6fpNshNNrsCo7Ld7rxW3WE=; b=pYhTNbVtOTu+reTp
	IjL8nhdwROl6Qelb9lg62CnVT3zEfRwAKku6H26Zn6ca9ScBS7Q5D7IDp6E0myQX
	pnoO82BjFrwyFQubG7jf6wvFyJW5YkSoL1rn5dVcxG4vDVUEGsDGoM/nk+124yDL
	YCQnLaKwEVkSShnhHkrQcbJpxoIKZDageORH16zVSCh+zYhpJB58GexqLa7VJBvX
	cM9z+fACKs2ZffLyulUuY7NHnQ8duDN1FTUDjbbLb6R9205pgaxvCTGEjdaXOj1Z
	3r7WvpR1HD4nCpnp8D/7aXGJLt6oWpH1McMnA/wNq5uen7eFeYPI1wXb1ygeD2Yw
	jz7vhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cy8f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 08:17:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517a00fbac6so28845671cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 01:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780906678; x=1781511478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8d0/4vXEmooPSaDLfa5X6fpNshNNrsCo7Ld7rxW3WE=;
        b=S4snrmbua2mhD9yq7NMd96OEIjIAcbK4Xp5ZqRoRUpRivyJxppb7g6GUL2XWJ3+6Pr
         a57nkdwiLxN57a80D4HcoKmC2W9UwkXUPNx1/o+BbJIycowCgqYEx8wtwKSxiDzX8cgi
         Y3afNW731vduskSPSnaNgcDHg2Tt76kosN4OMk8LHsQArb31mS7WvEfUp72ZA362EMtG
         hJIMD7jTamYVRRDteA1LlklUE3yxaveQmD77yQK/MVkrFjAd3qtb4WHiW2yaQxyKpnrr
         fmuH9k2vnh51eEz1cXWnrla8FMPd1iB9pIp/DX4J0StkIvJgJWgQXu73gh6nBG1jC0gJ
         pCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906678; x=1781511478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8d0/4vXEmooPSaDLfa5X6fpNshNNrsCo7Ld7rxW3WE=;
        b=HhKP2vz1HkgDqfLAL+Zzm49J5SpzbLiAf3SvZLSkmDQa0tdp9vsPsS2ph/2hx+g463
         ssnoRoxATt+19ISZH6F0xxsLnOh4JG/Hxy+yRWp3rW3FJWo2MYyfmQ7U364iL0ckUurg
         hlcnVbDobzKXnvtTDlYx/fcukfLqe7/8bV1YWK0OPKCsyU8J8up+d2Tw93kGDLexU95H
         vCH453dNRSB/N50hQMxQ/W1Ucgwu+CRJSmxxSHEbDWeSjx5f5IRlhheWGPFFpaHaSDNO
         RaOe2C6VRtAgLtTmy/Zfw54/+Q/FJVLLvu7FXMYgHqvTB4GqX9uKspF+Mnrg7dsmC5HQ
         EWiA==
X-Forwarded-Encrypted: i=1; AFNElJ+s1ih77slSTKAfdFswx64ygKCV/Veno5yePVsoc2d2Cfiu/+HsCapDGvVKnQDGBcyiCQF6z8YZoDQi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0wgdqO+KkOGzQjM+UAOUa6l0KQVI0qtyErH2CezHuphA4blBO
	NamxoOiQfaID3wQN3jhqFIrWwcVIr+Lz7lJMHcJVeKw9W6FsS/0t9vciEWtSop5y/Hbogn4SYRR
	nIwwi53epaCHIfTgWvMW9MpyzuOUTQXH5+Stm832Skm3Mv9SWTKE67c/MvCyBY0s4
X-Gm-Gg: Acq92OFcbojB/LmXPPqD7W2fcPgvMjwytPI2KV34r6YUJG2fU0MAulLfrU/rXbgQuYb
	FQTX4VeJIErsrMieBKmSwloKAeAOG4emUGMe0tBfiTZfZWCkhhoBa+hwX3FSIIo4Bftg9Q9Pq83
	9esXmZGWAhE+GC+8q1I0SeWuFbCNhtQjZo5+E3qP0KHYwtLGV/bK4V2SMeDoaDH1SCWmWf3p/g3
	qZznn0cCxL8S6sd95iGnWlXm02XOlPmDnfRpF0aUbbIGFu6ZMKrxjUjJKNqVgmhmSiaVLnnrms8
	r48UiKU+892aRYZXQPPy+C4gSdtxaStXvcw4heYunpQQJl8jbxf8ctA863C7nnh7si0FgT5W03a
	NZusUxfYPjxNzcYKDDcfx7j1gYrhB23gK1JMXwVDgK67ErekkGpcaFvZcwU0=
X-Received: by 2002:a05:622a:6203:b0:517:71a1:6e03 with SMTP id d75a77b69052e-51795b4ee95mr181807171cf.8.1780906678360;
        Mon, 08 Jun 2026 01:17:58 -0700 (PDT)
X-Received: by 2002:a05:622a:6203:b0:517:71a1:6e03 with SMTP id d75a77b69052e-51795b4ee95mr181806901cf.8.1780906677935;
        Mon, 08 Jun 2026 01:17:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm329157275e9.4.2026.06.08.01.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:17:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 00/15] treewide: an assortment of pre-2.3 release fixes
Date: Mon,  8 Jun 2026 10:17:54 +0200
Message-ID: <178090667164.43402.2303482952077574435.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NCBTYWx0ZWRfXze8X3Tj9nmD0
 mGHerLVofNhYHf/pJKxLZDc8S1/5vXrIJ12gzCmckcBAWKfw2c5xa7hCoyepL6YOJIQKoiykKau
 3XltDFsa7jvL5iHFuD/0iVug42hRI8iWEEbG4ikTvC3r8u+Wp0fLTamM97z/PBo6eON2KWsVDGl
 qUHxOGlOIop9sqCmkgSjeHjasMEZgEMhwvnLzJZn6TLCU2TQQkb7s8xqYJ13k+uVoCTvRZArpFG
 XQYjeoEWfhJYip/StzvOw6Qfas+MQX0m9+i46aT7MwMw0ldWDUqK62kLpO1eZQDkU6H7Ac40gcS
 pFl6Xarj/KDCQ+JRs5ulK18/LjYhwwGS3fGdzwbO1xsreKypVZqP34pYRLwjiMjpU9CYrv6x+hC
 vRGQz0+53XO28DDn5P2Knir7oAppW5BDTUd7KRx5+b8doLUaI7v+Vyl8CAg93qFjuwWYNjW8AKZ
 pSn9wzG1AhhV4AwQ8aQ==
X-Proofpoint-ORIG-GUID: P7iUmNb671wZLULUrE3tjK2XKH9lAAMO
X-Proofpoint-GUID: P7iUmNb671wZLULUrE3tjK2XKH9lAAMO
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a267ab7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QjXmW4qh-l3LqpYWMA8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38075-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60507654167


On Thu, 04 Jun 2026 09:47:43 +0200, Bartosz Golaszewski wrote:
> Vincent: I also used the stronger Opus model and it found some minor
> issues in python bindings too, so please take a look.
> 
> Viresh, Erik: can you please look at the rust changes and Ack them if
> they make sense?
> 
> --
> 
> [...]

Applied, thanks!

[01/15] core: fix signed/unsigned type mismatch in gpiod_line_request_get_value()
        https://git.kernel.org/brgl/c/69d0c580518e9cbe6c059e2bf17cde0e091d21d8
[02/15] core: replace strcpy() with strncpy() in gpiod_request_config_to_uapi()
        https://git.kernel.org/brgl/c/e5cc32989e249a6c7ca17f3ab3a81ff18afa7e6f
[03/15] core: add explicit NUL-termination after strncpy() calls
        https://git.kernel.org/brgl/c/8098a02b463d9dc733fc7bb64d1a88d921a1eb81
[04/15] tools: gpionotify: use the parse_config() return value to advance argv
        https://git.kernel.org/brgl/c/ff535296ff126c20de869ef3f358577087aa645e
[05/15] tests: gpiosim: remove dead container_of() assignment in gpiosim_dev_enable()
        https://git.kernel.org/brgl/c/bb191986617ae125f9c4c74f3727585b10caadb4
[06/15] bindings: cxx: fix consumer string in line_info stream operator
        https://git.kernel.org/brgl/c/f4ee1f36f90251228bf33685347edc50116bc7f4
[07/15] bindings: cxx: drop redundant class qualifier in line_request::set_value
        https://git.kernel.org/brgl/c/e773070e6e2bb43697cda0e1ee2ef45b162aafca
[08/15] bindings: cxx: use get_mapped_value() for all enum mappings in line_info
        https://git.kernel.org/brgl/c/b5225b6d765c926dc87db48c38b707db425287ee
[09/15] bindings: rust: avoid potential panic in gpiochip_devices()
        https://git.kernel.org/brgl/c/b94f9591e6df744342f748362d9c301df2512782
[10/15] bindings: rust: implement Eq and Ord for chip::Info
        https://git.kernel.org/brgl/c/33a92137f18a14d2773c3d84a3b2f8f76531b8ed
[11/15] bindings: rust: use repr(transparent) on edge Event and simplify casts
        https://git.kernel.org/brgl/c/62283cc98c2c32dfbf890c41780283ef73dbf3ba
[12/15] bindings: python: check for errors after PyIter_Next() in request_get_values
        https://git.kernel.org/brgl/c/3c04ff99496b2304e55bd63601f414b944c75daf
[13/15] bindings: python: check for errors after PyIter_Next() in set_output_values
        https://git.kernel.org/brgl/c/e6fb6554e930021b4db99f99f548592b42382e20
[14/15] bindings: python: release the GIL in chip_get_info()
        https://git.kernel.org/brgl/c/d7d6ae8dd40b995212b2d909b0327a2011143141
[15/15] dbus: manager: move g_tree_remove() out of g_assert() in gpiodbus_id_free()
        https://git.kernel.org/brgl/c/84700a6d5fe7f4499d6117b55e670bbda72b95d7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


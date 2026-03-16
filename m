Return-Path: <linux-gpio+bounces-33470-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJfPOXjKt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33470-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:16:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77A296D32
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ACCD306A90A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E569438654D;
	Mon, 16 Mar 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjHTlG0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dC3Q25aQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1CD38553D
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652304; cv=none; b=cF7014SNDe8QfOt5jhgtmJCqQP9f/YfrDGqXX7H31Yy4jB8S/nih8hAntb2vgzPJP5ty01JUuFxHwl5EZTCaRcGdtlAr28znaiIfEkNArIoRxEyr3ba/hWH4g5wiIJBBGzeNJ6XB2u1CYS93wVWz9PUwHivDJO0GRp7PObLgWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652304; c=relaxed/simple;
	bh=CBqKBkixJcL49R3/nNUtJRqnXQ9L3MSqsKZZAGhimfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9lceJ7c/6w+LyxjL7YFBwqr5K7BfIcpmQkN/bqKgUVvzCmyl6M6zrMX9SHFBtrJxvAnnVWl4cGQ0amrIk/pkWj98JQqxupeaE+cF5pMgrpx0HHhSssZYWh0fbQW8mg65U24KQqgUOfHR6qqJ0JdicgvDzcF/Muthpfau8rgi6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjHTlG0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dC3Q25aQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eJB1282091
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWROW373mwiI7O6Fbnk1x75Q8LQiAGjEqe+VrZRQ+ME=; b=YjHTlG0BXUSexuE2
	xoZCZ+QOJPmQwW9FZ6kx+CGqm8LHN6rKl/vm9aCZ2JyI8ULWKG08Qcsx7OqJelPq
	HZk1fuLPqaNJ7ZL0I3TBeQoDC9FM8IunpMwhVikuCezvlPx7C9c3GUCXm0hyojwX
	bdFst1uXVGIZd7g+lke1jTqc2tSVm+bYJnZqARK9g1v6w/bL8JGhLhPFDEPneQLb
	88iI1XsTOZeFMmtwpPYrN7h2ePgKlY0klAYs9d3lx1E3eG4PGZDD3BdgfDhqdryO
	dGR9wka4sHHwDWQFH1nKaWLD6IPnd1+qwJJhXKYJhG/iVvyxnVtbVlglzOtmiube
	fpp2wA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc4vmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50937c5b742so557114051cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652302; x=1774257102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWROW373mwiI7O6Fbnk1x75Q8LQiAGjEqe+VrZRQ+ME=;
        b=dC3Q25aQhIHgVy9GkyPX1Ai87ngTgI4KLZw2LGrJf/6YgcrwaLXlrBjo53n8NC7pDF
         OhF4/Bn+b2elnLkhyvvekIn2AhXTq+yloVGmPZcq0GBthFLyuCNnPkUyLu15tsi2Czk4
         axCKR4EkO9VTtxBuc0oZgJZlWqv/g/vxDWwdTLjBIttjPeSLVdYyxr5uTRHbpX8LPGVP
         ITp+1I4ZrGhyNMksLXuSVjlHoolfMt60/O9mlAi03pgDQwFAsFWC0QQj1n6tRbodpxw3
         jZjWzMuZFDjSUmywh1iHHbZsRWpLhXbIHrH36cbnRAxXoETvNeSuK7Qxu24AyteygNQV
         fiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652302; x=1774257102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWROW373mwiI7O6Fbnk1x75Q8LQiAGjEqe+VrZRQ+ME=;
        b=hNXG5eYwi4TuKtGZmFnJT2qCwnYfEs3oXjZlGYLOaI+txHd/pbrzms1KMG38MAkh1Y
         Z7QZGeP3e5/6YfyPL9gkkZQ9GgW9eQxZK6mxXa7xlgRKdJ2cHx3u+gNkKkpHd+XWBpgv
         Y1Jm2YVvssbdHwWMZBa5/zkDBQRKLoTv1CdCVw2Go1PNWFhCKarjq2YHrSLu/JSsIqsB
         ZRHaJIbruvKjo+eOBwNoKdZKWZDIGjIOAtTe2xckOc6Ej6gZd0J/t/p/Mvhg/31mmgRZ
         QQkZx5id3iyIaDc4crNCW/a6trbFyAs4HOCYyPsOggdq18rpayoCXwResZAzyVLxVLWJ
         ZTVA==
X-Gm-Message-State: AOJu0YwCieNCL1vl01dL2h0AU+fbbtPCUqH0BGBpAhx/ScOK1E7fqS/i
	/scPlrko700BqCqkxahoYBCPZtgeBoQ921xsGyNi2dxnSTtP6eL0DDWRrcOBqkN3MEU+XnInC14
	/UT0kLGT/e7XmpG4K2SzHFnnOrABOuTfnRJ/qVkpIDNfNBrz7uACLXsvT7wUyayl3Pt/bfcxB
X-Gm-Gg: ATEYQzxM5y6+Ho//Q4J0utcucrXOeVUqPdFvwdomaUMrLn4JWbIp+zsB+yB1i75tApJ
	6iXACZUVijyLCoZ7KeOCgBGNOgluCqY7coKnetm7JoneVR1aPyuYSA+akUQ/5bU6LR/exrt/dAs
	9o8HumH/efy0cyzoTxADRI+D4IPZKclGRrmPhBEtUR+wKDmYGgKY3+k+c11sO98KbBtRG+aIPzo
	mk7Vzd68e1HA4VR7dk52Itje1McEihpo/GP2AeaMJ81EYhcgRgLJw5wYXzitasThRptZV6p7hNS
	JnluNCOYqA7kbwCSGKAusP+bDMrkSI4nuu3BavTNgKH74r8fKNVaDr/Zx82HGXs8SIgt3OBv/nk
	lv9tmo2GCjj4LSDczgUYFIMiYp+FbTQNqPXJDWXM9e8Mn5q9/miw=
X-Received: by 2002:a05:620a:31a0:b0:8cd:9efc:7017 with SMTP id af79cd13be357-8cdb5a7b829mr1650849185a.19.1773652301662;
        Mon, 16 Mar 2026 02:11:41 -0700 (PDT)
X-Received: by 2002:a05:620a:31a0:b0:8cd:9efc:7017 with SMTP id af79cd13be357-8cdb5a7b829mr1650847685a.19.1773652301267;
        Mon, 16 Mar 2026 02:11:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2932198f8f.12.2026.03.16.02.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:11:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: cs5535: use dynamically allocated priv struct
Date: Mon, 16 Mar 2026 10:11:24 +0100
Message-ID: <177365228189.54363.14088360418581527680.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313001209.117823-1-rosenp@gmail.com>
References: <20260313001209.117823-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7c94e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jOpcv3BVh5reMBOGAWYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 9Zzi2l1G-L0oICjJIbeov0MJOELFyWdP
X-Proofpoint-ORIG-GUID: 9Zzi2l1G-L0oICjJIbeov0MJOELFyWdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MCBTYWx0ZWRfX1zmzQ+QhDv1d
 lVrJ9NN7ekRf3lGCmHH2h/9ZGowpeUNOIy6N/xKKvcEtHSfh3kp454TD986iiUklOf2LcaBVGb9
 qRKyyVIayX+C9nLC5dDLXeow2bVKoJ3eSxLVcH6hkmRilSpeQ/P8trs9FFbEbggqxMwYVowxWyx
 sE3CTZFwXo6G7KPUPVMMPhUkGTkJ254t+Y0oiSwlsaSCqHvDbwlwVBWMN5pfwJMmrBpZNFRqUK8
 76Z/9RS/R460cR36TcN+6hNTNs2rOfV79XmSyWyPmo4Gn/baBled4ouOmod8YOR7S97rzjPwrak
 oxNELnc54MULQmi1Kiqqbz/JHi+EcRw5AFwo0rWNuCeNpPGpQdO/hX7kgw5IGy6Z3poEg+V0L7U
 OLCdO41iXJzIEvVeHuTQlUB6c2u2xfiuce173M0XhYVZC1bzjMVLrqVtKrwBQoO4OCmAneYzW7e
 KtXAwKaNqtgt51j4kcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33470-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E77A296D32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 17:12:09 -0700, Rosen Penev wrote:
> Static allocation is deprecated.
> 
> Remove the FIXME as gpiochip_add_data allows using gpiod_get_data.
> No need for container_of.
> 
> 

Applied, thanks!

[1/1] gpio: cs5535: use dynamically allocated priv struct
      https://git.kernel.org/brgl/c/a6e53d05ab849779d55ca985566a1da7f22435b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


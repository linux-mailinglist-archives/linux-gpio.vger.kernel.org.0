Return-Path: <linux-gpio+bounces-34773-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAbKEwXg1GmZyQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34773-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:44:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7593AD177
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6568300E162
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30073A873B;
	Tue,  7 Apr 2026 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Upg/H1/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2oZSDPT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09433EAE6
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558656; cv=none; b=XwxMvBWBM9feBINev5GlS0rJC0RsRMEQhMTtFHGmkUH0tT9QSUmutsbq5NdqM1xMk+rj+YIIe8gg83PJ5TCYkbJLeZZ/GFYLqiSAE7p4TtTVJA/EDpACb57BTshNaq6RFXBQH7zyFGe708gkEtRMaKIiLtKxhKI+l4OvtXyEIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558656; c=relaxed/simple;
	bh=zkrJVhzDr7Odn1qDz5ks3BLS/88IcH82dFW/m9vhJQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s8yUsgAasl/JHTBCwvZHdmmMTcoL9k10kCGtizxOqlq8xnuqGMqDZynZIw58uUutOVognp0pthj0TcK+AlED++OnVQtuXOoE+4760b/OaAA2310gEFiuWR53Oq6muDhJcIYHaRq0+evsLmfmuAG94J8yb/jGnqQa3pgsF7Av60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Upg/H1/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2oZSDPT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376fnZY3816869
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 10:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUx/o13HFbZGzDMDvuX9h2cJZMAfAHn78eBYu/y6DLY=; b=Upg/H1/QJpgpb0hK
	V3xOqQwOT599cR9axmgCny6OqxRkdq8hdmnw0YYZQ10cXYAs4Wz9Z5uM1ICgH1Ip
	RSwOebDfgm4ry51BG6CDzU1eLehrP78pgYOZsFPeLFPI0QhyYueeWn92lXnI5+JF
	le4+lH3UtFTTB1oMv65/jjLBfxSKQDjCZBwm2XEAoKez/9Xn15mQo2n0rtczyi9E
	uHb8M+xenMkhamZcq4bU+gc5fzl5tstSPlfNmRAepRsQSlMSZa9wf5iujPOgL7b8
	7lAm0zWhYIrfmaN+MRhDYtGB8GD5YYi/l6WR3SKOmXigP5U+HAk38/bcGUQ5d2h2
	v56Zlg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tbrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 10:44:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9d52ad9aso27037281cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558653; x=1776163453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUx/o13HFbZGzDMDvuX9h2cJZMAfAHn78eBYu/y6DLY=;
        b=K2oZSDPTvk1wdA+8HhKjsvfuIgzQaMmdcyr6+AM4Mgs4ag3cAZ2uwD0IKGKIl37SVi
         NSisdalKFubvArHgAXAD2l8WcdVWP4J5NyWMYJckP4LYhyJDCD4NI5VI4L2uEOhuMl0b
         ZFL5LQA3AmjQpgzqj2YqBS9EmUj/WOzwq3s1/TiCBhdx3rSPk2YysA+77TG+nCb/twQY
         zaj2WKjYE4zQ72w4v/0vXfmMIZ+3cD9Xt19jtTOfRD/oin5t/lX0Up0rPocnHobQ434W
         gKkWgRRcc3Ff53enJJnss8KScP5s+56zX1d+NZSc0Gelm2xggeB1lzzXT6guyPoreFFc
         Phig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558653; x=1776163453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUx/o13HFbZGzDMDvuX9h2cJZMAfAHn78eBYu/y6DLY=;
        b=aCkGDEB4uFWx6Z0vL3il98merJa15O4mRSOGGexOoF29RfAytVCNb1z+ML3Pb9cJua
         NkFonnr6xvzyCNda5aMlylplTwgi7CbPsJWPKrIsDCyK40OHMNDFIEbQurL5r91K5Tev
         YE8l3EbP/1RX7TyqmEYQ2IB0AFyapnvcy0D9q9LmJcU5469AP6d9GfYMfXS0Ct3LCvAp
         n1V4KrLa3lkKSShbBTtkx0Nt38G8peZ7lQ74trXyiL769+TvbR8x3qhNKXktFI4k1o+w
         TJogI/OyGU0i3xyXaRgT/WLqVTpZaCgWg66tPA+KuFpQGNOcwmNlqbmW0yqPtknF8oag
         I9EA==
X-Gm-Message-State: AOJu0YzKJAJxmtEiAxJCDiQxddKyW0WbO041OHwWNEQcxwc0zEywLtG7
	aS/iXMVOLTPGb6gqmA6voBzmTaxmcjJGSTkHrL4SqBir/KOPfplZgS9S+lo/VW6RekWN7JRKvwX
	s+iw52D8mBTdAHNM0SrsCgrmvTthuOq0HFjJlUShVwrPf3brux0uqrQ6dKYmrjGWy
X-Gm-Gg: AeBDievuep+eeIW6qAqLU6SWDNPK4v0/EN1m4LrhFYKf0rOiL4dtE/xeIS7SQEkpARC
	qAMCNzmrBxPIlnKenkN9gf1pMcZa1FETGF+9Jx0RdUYLMv2hy+pybG20OqyGc/jM2NQzJomTLE1
	T1loqg/g5wq5hAVhsmpVijmnVoa+X/ADlYNVnn3ScW6wH4a6W0FJFufgtsaNA64lL2iY8HTTV0G
	SVarVgqscUY4eSwO0C0ku5Aujam/0qhHyk9PgEQ9I1LYpFKTRoyyf4bvYK6tRuHkmIu4Dg7J47q
	kQj/4cQBjN7UDzbfiTYKiFe16AcMRZc+Tu1ACi/1xmeJfrNghUZDbBjBc3ZTOW3oRQh5ScX3v3+
	rOdr2JLTMSA+H3Ede4bSUwstHIw/2/3IR7UuNmOC2s+jzef6bfA==
X-Received: by 2002:a05:622a:4a06:b0:50b:532c:2ab4 with SMTP id d75a77b69052e-50d6260a8f4mr252369011cf.12.1775558653535;
        Tue, 07 Apr 2026 03:44:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4a06:b0:50b:532c:2ab4 with SMTP id d75a77b69052e-50d6260a8f4mr252368811cf.12.1775558653079;
        Tue, 07 Apr 2026 03:44:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488bfc31418sm64902885e9.3.2026.04.07.03.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 03:44:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Koichiro Den <koichiro.den@canonical.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] gpio: kill dev-sync-probe
Date: Tue,  7 Apr 2026 12:44:04 +0200
Message-ID: <177555863865.54615.3842628804924926674.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
References: <20260327-gpio-kill-dev-sync-probe-v1-0-efac254f1a1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4dffe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vuTtAOjKuU0E0z3EVRYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: x55nRAU8f-s_0gULCwM8NISnru3y_XJK
X-Proofpoint-ORIG-GUID: x55nRAU8f-s_0gULCwM8NISnru3y_XJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfX88ShqZstBrMF
 0hliCB2ClEq5oDGtmCf7LTgFR6vAXnQ/szm05wAxLuLfqCMuCaPKPWhdaUpNBSDcVjfIHEl4M92
 5PF3ALumCyI6MDJVixYHsBO283Yj2uMTEMEJxQnKLwqhLFBO1HC4gk8/9/v2B0orYLEtUZgE3Zn
 dtCa104sK7d3hqLDDsxL6R7LMMHVvw9N/1XUpG7McNDQzU2X1y1FzELsqSoiHmpRbIsTeZI2ohR
 0XeYv1nONfGa6r7es7KnNcKu/WOFOSCraGXlrWEI+/15zq7Ds4vbZdulkZi8cEWRDycITFT7+mX
 WY1+oRUozXH6teJitUsvP1zf3gC3m6+crQrywtD/cWRsZrphBwD0yFG5owA6cHB52+SmnhHllQb
 UvZiGJwiL4Tw2SOPxi6PQmEDRLRU0joGuaN2HtkeLSiG85S5QqXP1trb9BYP+R0b73RlcN7p1yt
 RZ3hz+TfwNTkcZxOIng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34773-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC7593AD177
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 11:31:10 +0100, Bartosz Golaszewski wrote:
> I came up with this elaborate mechanism to synchronously wait for the
> platform devices activated over configs to probe, involving notifiers
> and completions (which was later factored out into what is today the
> dev-sync-probe module) because I didn't know any better. It turns out
> there's an idiomatic way of achieving the same goal with much less LOC.
> Port the three drivers to using a combination of wait_for_probe() and
> device_is_bound() and remove the dev-sync-probe module.
> 
> [...]

Applied, thanks!

[1/4] gpio: sim: stop using dev-sync-probe
      https://git.kernel.org/brgl/c/7fb3287946f937a32adad35c9bec4bbc71e25bb8
[2/4] gpio: aggregator: stop using dev-sync-probe
      https://git.kernel.org/brgl/c/3a27f40b457053e6112a63d14590e4a3ff553b44
[3/4] gpio: virtuser: stop using dev-sync-probe
      https://git.kernel.org/brgl/c/c3e2a8aef28c48a94c0cf0525ca96aa308bcf961
[4/4] gpio: remove dev-sync-probe
      https://git.kernel.org/brgl/c/dd84f7ce6fd12fb5d6648d6b5d8ea4bf6f834273

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


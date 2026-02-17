Return-Path: <linux-gpio+bounces-31760-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGotKM53lGlmEAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31760-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 15:14:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785814D0F9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 15:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDEA730530A2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4660936BCDD;
	Tue, 17 Feb 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J22BLFMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBkDxPck"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16642361DD1
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337521; cv=none; b=YBb2m40l9NKfKW9CN+EmtxLKDnHUH0EIn2lcem+D3tWLSKMq/FuKiO5MDatZ0uXryYLxKrXszdN6zhMmJ64X8e8WtAfHYWJ2cw0lJlg/mAqSCGeoGqhkGu3OlP8bK5hm352Xt+b5THYzt37/aULwEU4UYnQxNQ6MgFDWOqVQytE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337521; c=relaxed/simple;
	bh=H18t+hqmxHkO63jnPtevjUdedJ5Ld0fq8Y95eueDyHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNNAA+ypvTSbh9Vgw1kvfW34os83GispYlvIBDf88J37IP4pEflpOSzCKGqW1RKJBAELExZd/GJZmtMBji/psy+ybWqtS8qEW6D411OvcU2N+P9TbqfSSViNYRejDr2lCqjjKDbHUU+JL5fKcclBCYn2S5oGHiPcoLVP4bV1Pbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J22BLFMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBkDxPck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HE4cbn2112149
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 14:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1La9592Gkahc9ibwO2vaScpIswOEryDfPuq5mZ2d6kM=; b=J22BLFMpRVMH99X+
	EIYq0OrKmU88GdxZ0WSVRZacvqq76jHDDusxnl2Uaanfj8hGqi8GHsGjTwE5Dk/4
	at2w6DJRDPMTSBfbPKn1rDqhcNfsrqLejIENyLavOvYf+hbofhNbCvNaHj0i2l+d
	viMYAWuZyPGtB4m2QEnOfRev6ZL32v4Jzqo9YPJ4Shu0fjPrTXe0zb1cypMTkF4Y
	E/nyzJXHhA4JI8ZzqVyz2dB1/CJnvt0/FYHqIFZO/igmHdpO8hQp0SYBBhd5WSDw
	TDdkuqZULgcIaA7bT4lSxilyNiLr4ahPW9oZzT6dbHMDDkxUMDULWmoCyPccBi6Z
	ll/n+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4hapc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 14:11:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so2482677485a.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 06:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771337518; x=1771942318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1La9592Gkahc9ibwO2vaScpIswOEryDfPuq5mZ2d6kM=;
        b=YBkDxPckwE0twl4tjwy6YmRICZCX+bq6qqUmh3Hoiv85F5NGkCGWw0Q9LsELF1DSxk
         +5nh2Pvzsr9cU5QXisoCrGX/ScE6/ldi+J1aBcGG7tqeO1d5Aht9BZblrngErBE2onPj
         clk4l3mHgR8VXWd9XY10FymaMWV1KP1ob3rL/tx/F2eXaPmWVcZnxjbYBWNEmgdGVGbX
         wTKQPQE0R8CO4WXWExN6xghLoMo7E9UAA80qUhlClOof7nnMPoTKtL+Ej8HXnkXOCHle
         Y6qkQa6x6I2eQH9MM7MsoZH5jK21RtkVSccKS1oE3yj+hQy5zvITt4vDVgPAOzRkBoMu
         fGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771337518; x=1771942318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1La9592Gkahc9ibwO2vaScpIswOEryDfPuq5mZ2d6kM=;
        b=gXuKSPEb4thxr/nPwIWmAHqW+M37A64JbPhhjChDBeSbkTLJwMHewj9Va9lihLGShd
         CO6b1HxifzazPKM89acTv8WMyvU2o6+l/QyxCKw6mX5za5jvK4bdik6/0oM9XliEEAw5
         T4VuCV5WrS6jrvtu8/azAZJyps+6cigG8wKKN3Q4PH4MhHWyR6Sr+EQlSqBwgrF7HSFq
         8Rm0c0gqr42qw/rYSVAbkahdHI6B8VZXCD1pplKMetJeKMOP0ZNvwARRFpyrdAe0JldL
         MIBnuYGxKqHcNwWYnQtDlr76s/7EH6oJcmWTPqmK6k2NnBmFlYmVUbbPh/A967PQNZIq
         Q5vw==
X-Gm-Message-State: AOJu0Yyjn1g1keeeOmiMXTgq3ByGshi28/bY6b/IVT5D+KCFKFIE0OdB
	cppSUNgPI48PJHmdM9ZZy8GJ9kPEQAygFTwPoue61zistw88BHarWYlm+4wNSRk655z6AF79Cwx
	tefIA2hMvzltIamHew5SaX1omoc4iuaHJxi2ltWlTUzaXbdlYd/DUudPhv4SgzgKlK499Bfvk
X-Gm-Gg: AZuq6aKT01duCWmF5VyNijUKZkyECcrweHFTV0J7sEvPAA57YhebpLIQWXLqWXRJmqN
	6VCpxGGa0at5ZZnjKxclx8dgyybmeVHiOsb4hOMSOGMV3W9wOsHjx3MwcFmy11EBSP2HgT2i8Sv
	KujkK/KiSbPNtkVicFXCUsqDRtDHqZAPdvzBhD+bEQiq0a24ZVrKLhTd9c51Cfek07nCm5azEOD
	h9E61/Aolycjpu/otDRSOJVVqdiFB+hTwOdRvgmVtYK73jqomurwgi2RtKakFWG/iQepMoQZjTt
	BPd6yXSibM0hPvOFXcmZpzaVG0qVXO0z0LNDFX0gwmiZINB0kQOnVeT61nBhC5re97hhWtSXCug
	IP/FILAx814EZaiBbuQwHz0rNCzk89qT4S/K64N+kW4hn84rQIjw=
X-Received: by 2002:a05:620a:4003:b0:8cb:38f2:6a5e with SMTP id af79cd13be357-8cb422823efmr1590504785a.25.1771337518192;
        Tue, 17 Feb 2026 06:11:58 -0800 (PST)
X-Received: by 2002:a05:620a:4003:b0:8cb:38f2:6a5e with SMTP id af79cd13be357-8cb422823efmr1590499085a.25.1771337517489;
        Tue, 17 Feb 2026 06:11:57 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3086:8439:90ba:8f29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8209sm36620948f8f.30.2026.02.17.06.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:11:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, David Lechner <dlechner@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH] dbus/data: use prefix in gpio-manager.service
Date: Tue, 17 Feb 2026 15:11:55 +0100
Message-ID: <177133750894.14752.17917841550723562846.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216213223.984050-1-dlechner@baylibre.com>
References: <20260216213223.984050-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=6994772f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WXPAmdWQjJnzwOs63CMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExNCBTYWx0ZWRfXwTFKstWk1JqV
 CDR3ly8hGnDO+KTUMtJVdWySvmpF9kzb3D3G8Y/5fEOetVgV5dPN36hROJWUARJFSMOgqLACQuX
 Zs0BOPZ52XAp4bgrmwQHRRfQA/swe9CZXWp3A97OZasnYRxV/95kcZ35l7WJHGg5tJBm41hUI14
 4W73oucsQvc2dVzyHp19iXrOaUCFnBLuzr7OUXuB3MOIcFVPwNMOrcHaviAD86xM66LNgXAIkM0
 43Nzjhoe7DrsXK4dAkqjWqkLQhh8FDWXehMmq9B4HVRNEpL9UsD9LBS7IpdGxUaJ4NPgzdRT3bb
 0rjS1U9xUVKxEKY8yPLOY3o5YuQgS8mpyXp6rHjXhqCi3XcN/RqCpb+gRlynYOGt54e8jqI+uCJ
 svMqdGMlBbR1HLrs1TlWXqXE6a2KuIWL7m5V3fClSmXmKWzVIdruFmhJxta3gQ1bJnxbUvGK3R9
 od6zsClSP9dIaxtqT9A==
X-Proofpoint-GUID: 4_HGZVQrXzQhy6XagqnCubnAiRQr9JQQ
X-Proofpoint-ORIG-GUID: 4_HGZVQrXzQhy6XagqnCubnAiRQr9JQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170114
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31760-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0785814D0F9
X-Rspamd-Action: no action


On Mon, 16 Feb 2026 15:32:21 -0600, David Lechner wrote:
> Change the gpio-manager.service file to gpio-manager.service.in template
> and use @prefix@ in the ExecStart line. This way, when `make install` is
> used to install the service file, it points to the same path where the
> binary is actually installed.
> 
> 

Applied, thanks!

[1/1] dbus/data: use prefix in gpio-manager.service
      https://git.kernel.org/brgl/c/ec908dafcdb8fde8eacc168adfb176bc6412ae32

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


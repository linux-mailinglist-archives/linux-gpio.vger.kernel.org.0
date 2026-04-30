Return-Path: <linux-gpio+bounces-35831-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLBvGbYA82kvwgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35831-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:11:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCE549E6E0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DFFB301CC78
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 07:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDD639F170;
	Thu, 30 Apr 2026 07:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VODbNhUh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3A139E177
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533060; cv=none; b=RONIQa6RoeNDNvYvNXDJqhsvB8CmtU1mfQHz4m9TZI1z4Bm48IY2lTapU91VFer0xFFKeLPbEsF5pPebZTTdtqiQ5AViKYI+QjUX/2PNrkoom+WIhTI43ZUzTJWXxMeRLSh59Z65YPl74l47BcGWXROFmfnbbYyzyWvV6ENR7+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533060; c=relaxed/simple;
	bh=oZ3hYpOlyjlAu2278aiFXESG6oi7YvWn82sNwQdQAP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TX7Lihyv4ABBPoYFpy77T7pAKkr0ig8knxcrmh3D5O8Ozhfts4PLFYwurieXIihSiQRXysAama/choh+a/Hi8yS7gNvvFkhvNlTuG0aGVZf8LfH5cEa07cAm4+fAOPyXLaqKK5Fe5NK93saz2dLFdPM7hYRcQ/p3MLzPHYxpxGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VODbNhUh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ad135063so4488305e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 00:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533056; x=1778137856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPu3RWNcjFZI9rac4rwEI7c1s2vJiCf0eXVgZgLzeeA=;
        b=VODbNhUhZ3JRsSFXqxR7ajYR/J/ppN7xF7APpx5guY84on6LaYIh1pci9w5cQngOp6
         bxnIFW13x0Stikv9uS1WL6Vs9uv/VxA2slTW1AMSMAQ5mL/lnjtr2NaBAWrwFTzgjgWH
         iXrV8ucn2kll8/rqCFCJc9i42MqR6ZO04+5pi0VbI0qCRP0JhbfWFqPpQry00eDYwD2q
         MmeEIKI/gqwgsK1qHhVx9sI7nO23cBUdlfWRRQbmIhaTswQQzHau/TB5/Q6WfWPbJIt1
         4bElSMrQlQc+Zxwu0qz4Pn5XycXfPxI7TytISZYO3y/eyeuduFsu1cVRL8Ueth/iBEwD
         2u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533056; x=1778137856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPu3RWNcjFZI9rac4rwEI7c1s2vJiCf0eXVgZgLzeeA=;
        b=Kp7wtYWt5tjgKSJqFbkcH5+vUQzCL2HbdqhH4vYr6jEf1oPrwJpnkOv/kWPQk70nYM
         mkKFzJk+Aa13bEtlgOqVrzH+drTCz+6WFvAujTzM7OYQ4FDgoEHLi4f0d+R2cSA8rVdS
         5bf9SqP6HoFYgSBfhu38vW64Hg5vtlxh5M8clFSiULOQiHiod5CsmvVzAWQ4nh/Cj7WH
         WEaQMqUb0QMhSdpWC+pexQqSIZkVbo4M6h503fnW9xcPbja1mU9LeBovChw8T3MzUP7a
         TiwS6+J9xGxB5dcmpPmqV68qqCFegCaATAktGGFbYOBJv0ncichNsqV5tssCaEZ6tiT8
         i8eA==
X-Forwarded-Encrypted: i=1; AFNElJ9VZO023lkLz9n5uNQ/bGC9RpgVR0Bw/EKmrcq2GjmCLvw/uduaL/96hQ6p8lozMzxQ9OwR2Ppgay9c@vger.kernel.org
X-Gm-Message-State: AOJu0YwBe9EFbzgzo5mDOluD1nbSVuLJAnNwvv+Zzso171dobyPNhQMt
	04sc458q2Zg8I/UgeWSQXbJ47jC/bHDdmSG5dm3bYCFmQxt3KFNygiMipNb5NSobFFg=
X-Gm-Gg: AeBDievgUAbk/YvYgIWJJehn9WZsqYTrXqW2b9S+kXlW2hZVdjWLWEqszmF+h3Xbwal
	sXkTPp/S9GRLIZpI1WNyDGCY3od5F5T7rSTKCqvxjBm0W321XpiosF2zr4sAWwQi7vNe8cIjjOV
	LBtoG+ybPd0VttYz/MyUm/VvtijKfVYdKolrhoTyT+L1YFVVh3eCkPShTcIadbQuvRGn+nIOqiV
	RVSGFJVtrgAYpdrfV5jpsxPABymgCbjYny+heNZSkOI53S6j1uv+f/SiXY1I+nqyiH6yePtAefz
	iwFVBvKYA5zTDopONE8mH0WgDwDcWG0FkeKoM5A/zWK7mguYF8NET2gXA+dJvDJcJXFazcUquin
	Njg6gFQ8EWqq1ikQ+jmXrl4BRMFZP4FIso1pAe4RYJ2QFXwcF7/+sbRUiaYMMbm7HObGYp1gvbH
	WbE7OKkLuCg8UmC+OJcDpFqZ5G+qZ9o4oruwoUXV+ATxoSOHLPWNFTgNf9sFiLrjW5J9HcVrw7I
	FvDhKrS
X-Received: by 2002:a05:600c:350d:b0:48a:57e1:d8cc with SMTP id 5b1f17b1804b1-48a83e7055bmr29150115e9.9.1777533056652;
        Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:45 +0200
Subject: [PATCH v2 5/5] arm64: defconfig: Enable LPASS LPI pin controller
 for SM6350
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-5-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=846;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oZ3hYpOlyjlAu2278aiFXESG6oi7YvWn82sNwQdQAP0=;
 b=xad101UiCBqCR5XMnrmHZ5A0H2inv58PbwoxwJ1BifMHEpwZu2cxxBPrjyFkP/o232KkdMkh+
 gT2JdEqzJLVAiZh+7LpXoduaGVjaxXpacZlUQg0vxWrATb8YTEv2vJ6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 1DCE549E6E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35831-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

Build the LPASS LPI pin controller driver for SM6350 as module, which is
required for audio functionality on boards such as the Fairphone 4.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..6b0be01af7a1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -705,6 +705,7 @@ CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
+CONFIG_PINCTRL_SM6350_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m

-- 
2.54.0



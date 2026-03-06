Return-Path: <linux-gpio+bounces-32689-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGl5D2DjqmkTYAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32689-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 15:23:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D410B222912
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 15:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C08A303A636
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 14:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E2E3AEF34;
	Fri,  6 Mar 2026 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="02JLylCX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BB73AE6E4
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806949; cv=none; b=PQK1WUHdvDhE9v/tOXpO2/aTiZtlmjnFr5JVgWOIxiXjxM1HUmR1gnN92Mg+AiF9T1YQn6xpqXcLdnos6sa1bPLCOtxRuO/ZYJ+4HEJOnwg5QMl/a6UyRuaIr3Pjox2x09P6wMgBTh7Jj2oT+7LxC9P0SdzTIKms9g0H6Dgm3WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806949; c=relaxed/simple;
	bh=OussAjG8fbFFqG3utkJvBKqk21rJMwTmbRmYRXniP1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fojOG8aitwjCT6vyzgYiE1qym7a1tpOv59hyWljTiWC/d2o7U4HyKJj9jSSVhu8N43BLQQp8yf2FWk6AofsYcqljk9c1/+yICIi3u24YGMZooIEZ8AgCf0mQui2QRxC+zQ2cg4ASCFcA7aKUM656CvrA6g1UPqiSAOpH+cFl3Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=02JLylCX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-660fb578f8eso5847115a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806943; x=1773411743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bRAg5T4pZtJKLQH2FWdjBQ+C0/ZtIItkMAKUEibNgc=;
        b=02JLylCXu3ArYlon0fZFqKnzhA8TfA8YEqxWSFFYqybwP9nKr8t1TqLNqUCzblDMjW
         SzkgU52tHjs1nw+qIiFmh5eY1vJWFDxVj5qfEf2AFPQOS9pXrB1UY0S0+pDxbttCESAE
         TqBUaTW+ZqA89DgHJ+HRnDWHMA/reOOMc/UsrjEaHJAqNnfiD9szfT7STnVRBFaj9DgE
         KZuJ4L7n7fGtqVOpxhsb8VQoXqGgZ7zCSXL0APZOjAIZPBs/mwKa456d32hlOFJLO6B5
         hlYkPvcWesPN8cb9MBushKg6InDyIGSbRdqkhaExIFSVSI9iyggU9tMTvrZrZmkLaAkp
         s1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806943; x=1773411743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bRAg5T4pZtJKLQH2FWdjBQ+C0/ZtIItkMAKUEibNgc=;
        b=wEZbHxDiJ3CG1GJWsv/C1QdZo3xeJiGvEL1vwnejaTO9K33xzQu2TTqZvorxXG9c5I
         WBQWTJP2NOCRnBuCzgGetFUdP/MniX0/WeNTvj4BlmuGnRtnGZeNUv2H9L0/+BK7mIHV
         bfdpcNYCVkN6x+XhlEt5KD6mX5fzqRAir+yI/MUkfnglGmHVBnBlNBlpM/JAzQXSVZNF
         6Xv+YPN6l1K04PTfio37ekotO9be1efRgg/tYbLpTIexykKC1jvydpF9p+vyqql+su9m
         BIPnCKUhMXx0QYvgTj6S37ogLJvLUIj0okbf+gMxR2WsGxBG6aVHw+8veHXcrLFx3xa9
         Kb9A==
X-Forwarded-Encrypted: i=1; AJvYcCVatCcZE9AEkLlzk2jviX4HuwrgLDETFaCuiyWe+Iq6JkHz4d7q2IsfDFrEIKHz9kqS5OTpl893p4Mb@vger.kernel.org
X-Gm-Message-State: AOJu0YwcsmK2NnzswmabuEQQXGqiBBub7Bwnk1ZkSCroIyENJ6Dxn3oA
	OVKHo46zg8hHPPV3ecXEguQOsiBaVVtaOZNk8ydaaRFb6s+uj0clvklPq3VokBouVEY=
X-Gm-Gg: ATEYQzzqTPnj4Gjr7zOdND027ej1XSw731of30/coTnQarIH8X23zVk6KXataw4+4Zw
	lWzX0DpZc8Go75XclgwhPtzpm3mYUjJzDi5MCJMXr0wMxilVNE+WN7Y9I4Ja8PP7X1MyUwz0dqw
	+Hgegas+omeSUVSBPxijRiwM6oorl7BoNQeguttezUVdHkZtfnvF6jilLTwAa0BStTiGGbZmZM3
	SYBC+el9/2vunBkWPRQuFiOFBVUdKxgK88iAeQq261523035jl3F+xIt+wKbpNMirJw+7WN5PTE
	8tYsYk167qy4tobhlIMo542Dz14zRIeGk9v0gH67KLy8G61f/yD8rdCEnGdekybRje2bBAyiRpO
	wR1/OD8hTsSA+Y/q10ztTb6bhUErkc4kQ5r9dleWdk/Bouj/KeUCeXzJetSKD9x2gOfeteYjkcc
	Y7P4tAAgU7pzEJyp590os2fHnSC6h/YzyJXF36eFfOLfJBw8mzP6KlwvVjr7OC8lgdaMcD/mejx
	81lsw0HeNtH+Bc=
X-Received: by 2002:a05:6402:f2a:b0:65c:6d0:d9f6 with SMTP id 4fb4d7f45d1cf-6619d45a976mr1033867a12.6.1772806942847;
        Fri, 06 Mar 2026 06:22:22 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:22 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:22:17 +0100
Subject: [PATCH 3/4] arm64: defconfig: Enable Milos LPASS LPI pinctrl
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-pinctrl-lpi-v1-3-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=715;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OussAjG8fbFFqG3utkJvBKqk21rJMwTmbRmYRXniP1k=;
 b=OFivjjV4WyuTlJLQsk+h3UHX/H/piTEXQ86vP+pJ95fnEmqvIn1T4M7vpJDGZwBZDa3wHTkoY
 SJIFOZx3T5nDalppNNIRJmjHe6WL4qFhs6xu/xFRPrCb7jXsMlu9YsH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: D410B222912
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32689-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c09:e001:a7::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,144.178.202.138:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Action: no action

Build the LPASS LPI pinctrl driver as module, as required by devices
using the Qualcomm Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..c8e294fa4b53 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -693,6 +693,7 @@ CONFIG_PINCTRL_SM8750=y
 CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
+CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m

-- 
2.53.0



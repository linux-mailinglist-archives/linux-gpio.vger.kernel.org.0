Return-Path: <linux-gpio+bounces-35387-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK3jN4yl6WlogAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35387-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:52:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE944D143
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D9E4302352A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 04:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AB33CAE6C;
	Thu, 23 Apr 2026 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="mZHGq98r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A45131F99A
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919904; cv=none; b=iHV+N0AxUSbR9qAMrdJ5I1FzT2prTCmclfcfovm8DWf8f1N6k6Ajh3/4AUHGtIX3GTK96MoNNPZHv7zNJsLsiCHveNg4i3lwdT8zqJNeGfakH2X5JXJBQ5ukaOIybF6EXahpuOcHG40VcxlNiHcu8XX6zE03LvaAIm3mFHw4Shw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919904; c=relaxed/simple;
	bh=kciEloRDikQR08p84aKSVcesSY8a27kOCB5IcqhSpx8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JJWCeRPrEbOYI4MzB088ZtYwVhc4E8IO2bIHlJS0gMQpgd2qrAdVz1QUKgsXWS3U/c+S3ThdUFrgC0qbviAtio7zK3ZShMI4xbhZRyhfpRHkfkB/H7JGNSIWWalQaizDbxnMc2cA2NDKaXh0bagHpADB04Dipjxy8ZJ3D1KJRAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=mZHGq98r; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776919894; x=1777179094;
	bh=w639idr66+T/gsab4V9YEsQv1aNpbbTf7RCWfWPMzPY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mZHGq98rj6GNe30oDs/Uc+SbQARtFknqdZVwJQX7PD8xZC6L35UZo88e97KC7GSmf
	 cwemGlXkVLTDu3qAs4S03X3zVWeHkk94aDfta/GU3xN4yssVQTQlELMoPXRKWNPccx
	 pW4AN1h7vF073fFHDHfvBtEq5ewD4VP0oweI/uNmi6iEgOc7jcJL549Bi56y9jnyws
	 K1WSCYvYhmhvJb9WQ938MHs6hyVL6zGUe27Ug/pRxo9wxqU0FGYuAJZZhHaZyh/Xfo
	 T/zf1mig26GvIBao3cOhY9o+T9SN3ZAwvJr95zybIyokcoRnOnodYp+2HNrGQs5/7/
	 TjCzfJCua2sSw==
Date: Thu, 23 Apr 2026 04:51:29 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 0/2] pinctrl: qcom: eliza: Couple misc fixes
Message-ID: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 5215b481caaf214edaa9892c341bc032b8d7f1d0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35387-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DCE944D143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series is just a couple misc fixes for stuff I saw when looking
at the same function name/same pin issue, but didn't want to put it
in that series.

Not 100% on the HDMI change here as my hardware doesn't support HDMI
but when I was reading some documentation for Eliza I noticed this,
would be greatly appreciated if this could be confirmed.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      pinctrl: qcom: eliza: Fix HDMI_RCV_DET function slot
      pinctrl: qcom: eliza: Fix QDSS trace clock/control pingroup names

 drivers/pinctrl/qcom/pinctrl-eliza.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
---
base-commit: 90700e10d2ad61c13a5117cfa5e08d9f2e497dcc
change-id: 20260423-misc-eliza-pinctrl-3a577f40763b

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>




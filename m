Return-Path: <linux-gpio+bounces-36925-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGQgL10hB2rnrgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36925-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 15:36:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 32007550886
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 15:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CC5630A9F0A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6FE42EEBD;
	Fri, 15 May 2026 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ3vzX9v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D788335568;
	Fri, 15 May 2026 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848815; cv=none; b=QjqtcvXcC0PBNl1o1loj+SW7EkdyliLQ2gCpLDlzoz7lE2dZrOTT8X8Pi21l20/mB6pxsk/FFlOoPLSc3+zpgYlXxt5yIjbFh4BzjjlgZ/SfuJPLnjmxLX10H3pobwRpPv036UxYVz3WrS1JxGF9AEJc88hFXWzvcC2+S0GCQcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848815; c=relaxed/simple;
	bh=PKbDGKp+tfmw+t+Q6auvN3/FN+stBHMoLlQeBdpxVdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NU+ULVo5Ip27345NK/EcXCDa9qUgAe3Cv0ceT3FWJetlT5Egcie7MfzMXOjxUqVNh6a6oLZ9JC+qKmPkGzEc2niNaIaaA63yrTPvRR/ioo4H/Oc9pNNwrUZWg1Ci4Ma3dCPxhtNWRF0xcza/vI8QF2HRuNw1roQYSoGY9r13GPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ3vzX9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F96FC2BCB0;
	Fri, 15 May 2026 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778848815;
	bh=PKbDGKp+tfmw+t+Q6auvN3/FN+stBHMoLlQeBdpxVdg=;
	h=From:To:Cc:Subject:Date:From;
	b=iJ3vzX9vu9D0r0Irgp9wSO2Waf17xwFs4JWx7IHQXo6z+ApQoHTUbuR8LgMrzuIqI
	 ebjb0J3og6CcKHEQhYTVSNK6tcMmhrJmUdi24oYliMGrGFrqjX899Atm2gyM34UwvN
	 +w2AC+RahzKGARv+zefFbNxr2RAnDamru9KmBYXKSQmM8e5OpSXacyA8pM4laIgp8p
	 oMrUDGnlAKhKrope9pF1m0w9JWPRLN0dhyNYT/JR5TmOsoBWQw/lmY6QlSytyq+9Qb
	 fs4Gi1KdCWP5TM9xKfORrj9PZ+89v13pyhiBougI727ookTwv18kSlziKvu85lakHf
	 JE+ycE7ys7Tgw==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	brgl@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] pinctrl: renesas: rzg2l: Populate GPIO set_config
Date: Fri, 15 May 2026 15:40:06 +0300
Message-ID: <20260515124008.2947838-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 32007550886
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36925-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series populates the struct gpio_chip::set_config for the Renesas RZ/G2L
pinctrl driver.

Thank you,
Claudiu

Changes in v2:
- used gpiochip_generic_config()
- fixed the return code for unsupported operation which helped in using
  the gpiochip_generic_config()

Claudiu Beznea (2):
  pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of -EOPNOTSUPP
  pinctrl: renesas: rzg2l: Populate struct gpio_chip::set_config

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.43.0



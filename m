Return-Path: <linux-gpio+bounces-11751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6209AA142
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 13:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B977CB231FC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 11:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD37E19B3EC;
	Tue, 22 Oct 2024 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="01nK882K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eMP+3OCs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="01nK882K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eMP+3OCs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28978199EBB
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597222; cv=none; b=Wc+qVUO2Wg8BcPg47FACMEFu4sLt3ZkRCm2l3P2BIGlJHR9tyYNssFO382E09VZNGIK6wPjdoQhThfPlx9wxHKXqgd86/sjgeItLCCHIhvAWNp7Jgvlqt5Tz1n7psOZUM5gc5JimVTYB5Bd+tOEL/W7GzrFVj6KKp7kMVA1c6SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597222; c=relaxed/simple;
	bh=XR1E+NZ8/b7dsub/geA6i2XnOrNbJxDqVVEAiq9qP/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LMGbwiXyhu5HWQzJ6O6P2JpBSdJefouLI9vs910tQy7Zbpc8NFu0CuRbfSw4f4rqYqYoVnhBkls89t7lWFyigf7jkJO5+6qnG7zTyn/L5haC4QhWFhl3fehpcHmq2biHUpSWMl1z8dVATCSyCn0GWU1k4sHNAjytMUQ3kmBXbQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=01nK882K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eMP+3OCs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=01nK882K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eMP+3OCs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4EDDE1FD14;
	Tue, 22 Oct 2024 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729597219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K+7MKnN4K++evGoFE6gZpaYOJjqEnBBRSY0tr/2wSXA=;
	b=01nK882KpTHVYu0o8lVC7zfY+vmSCC1RRLUXQ4filMflBzkWSGq+JYd+PH+9f/UQlnhV86
	ww4GabdXiM5tR8JCgSpEuNLLXgcruKdAsouAD9ylkOkf9VobzLlZst1L92EdFfbZwDnXl/
	NVqHiHuMYXnZG2kwpkQQA6Yfvg9gkpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729597219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K+7MKnN4K++evGoFE6gZpaYOJjqEnBBRSY0tr/2wSXA=;
	b=eMP+3OCs7Hw+SAOmVBEN6lXpzljx64I4F8YOCmlEy4pacqlRGVlCXkhDvfrx9t3QX6bSkh
	GXSq492fN4k0YsDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=01nK882K;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eMP+3OCs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729597219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K+7MKnN4K++evGoFE6gZpaYOJjqEnBBRSY0tr/2wSXA=;
	b=01nK882KpTHVYu0o8lVC7zfY+vmSCC1RRLUXQ4filMflBzkWSGq+JYd+PH+9f/UQlnhV86
	ww4GabdXiM5tR8JCgSpEuNLLXgcruKdAsouAD9ylkOkf9VobzLlZst1L92EdFfbZwDnXl/
	NVqHiHuMYXnZG2kwpkQQA6Yfvg9gkpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729597219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K+7MKnN4K++evGoFE6gZpaYOJjqEnBBRSY0tr/2wSXA=;
	b=eMP+3OCs7Hw+SAOmVBEN6lXpzljx64I4F8YOCmlEy4pacqlRGVlCXkhDvfrx9t3QX6bSkh
	GXSq492fN4k0YsDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00C4113AC9;
	Tue, 22 Oct 2024 11:40:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UmXKOSKPF2fTOgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 22 Oct 2024 11:40:18 +0000
Date: Tue, 22 Oct 2024 13:40:17 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-gpio@vger.kernel.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: imx-scmi: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20241022134017.172411db@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4EDDE1FD14
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,nxp.com,gmail.com,kernel.org,linaro.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), OF
can be enabled on all architectures. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

As ARM_SCMI_PROTOCOL already depends on COMPILE_TEST, we also don't
need to add COMPILE_TEST as an alternative dependency for it.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/pinctrl/freescale/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.12-rc4.orig/drivers/pinctrl/freescale/Kconfig
+++ linux-6.12-rc4/drivers/pinctrl/freescale/Kconfig
@@ -9,7 +9,7 @@ config PINCTRL_IMX
 
 config PINCTRL_IMX_SCMI
 	tristate "i.MX95 pinctrl driver using SCMI protocol interface"
-	depends on ARM_SCMI_PROTOCOL && OF || COMPILE_TEST
+	depends on ARM_SCMI_PROTOCOL && OF
 	select PINMUX
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS


-- 
Jean Delvare
SUSE L3 Support


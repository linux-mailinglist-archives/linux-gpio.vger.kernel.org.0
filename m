Return-Path: <linux-gpio+bounces-35757-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAeyGgu38WngjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35757-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:45:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A3490A80
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 744F63034B0D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331D133DEDD;
	Wed, 29 Apr 2026 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iwTqf8v1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF7F3A5E84;
	Wed, 29 Apr 2026 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448652; cv=none; b=n2aT2H/S6xRgQJ/e5VYoiqaAAhCti4VQoFw3L74Pfc7hMJ/9kbykCUWuRKdUR00vHqMGQhlu2+Th1f0IH5iZI4+RIANbyLYN32gfUzFpOAOlGgE1xB7j+oCxTz38nRq+WfpKyDKg2rpL/sBK9mYGs8akG7UJ9js5o+a4yChsNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448652; c=relaxed/simple;
	bh=GOktKvSAf/iV9pHKsUggRFymyn8C8ayVKfxEK1bo6JI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d41w3HL/FH6QTo2Szv/EjCChwZDKA63PhFUb7W8ULsoSwbFTIs48NP+ZmoHQXOQnlcM9V+IjgipO6NZrJWkG8xpU8qipiVnGYPtBvQfsbjP5wV6cOeB4F7HuoI24DCuQKD4neTfNOWshCVRwGHQhFZDj/EYTn9CKejHCLUFbK1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iwTqf8v1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D55F6C5CD50;
	Wed, 29 Apr 2026 07:44:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CFD61601DF;
	Wed, 29 Apr 2026 07:44:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAB8810728FEB;
	Wed, 29 Apr 2026 09:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=V5sXarxVB6g9u15sE7cvcyNfPfBrdDKsaQ44NecsSyA=;
	b=iwTqf8v1jTWvZh6GoqcgrpVdhyiED3IPB8wDQQpm4YNobnDlYDFjcikkIPEeq5EpNbMZDv
	1ehMTdC4UzjOcQt5bIBrk357kb8Bg6FcfIpHm8oSZfXLbCgrKM7eXIA0k32Bv0V2yAKk91
	u4e4CT6y4MxS1OXCJmhkWecNgX4eLWmed079ucouYMnximKf5YkkntAPRAWoV9Xf2HBd26
	BaY6irJWEnbygc9FIIoVxNRRe+96c6DpnKFWMBwBgXy1SW8criEkp2llc3vr48EoDADXTL
	iZHxHXffuYZVIUsrvIcKRFerf9mm1X0m+hjDUjjBTRll+CU5Afl9SS1Y93aGUg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 00/17] ASoC: Add support for GPIOs driven amplifiers
Date: Wed, 29 Apr 2026 09:43:36 +0200
Message-ID: <20260429074356.118420-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 0C7A3490A80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35757-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]

On some embedded system boards, audio amplifiers are designed using
discrete components such as op-amp, several resistors and switches to
either adjust the gain (switching resistors) or fully switch the
audio signal path (mute and/or bypass features).

Those switches are usually driven by simple GPIOs.

This kind of amplifiers are not handled in ASoC and the fallback is to
let the user-space handle those GPIOs out of the ALSA world.

In order to have those kind of amplifiers fully integrated in the audio
stack, this series introduces the audio-gpio-amp to handle them.

This new ASoC component allows to have the amplifiers seen as ASoC
auxiliarty devices and so it allows to control them through audio mixer
controls.

Compared to previous iteration, this v2 series adds the gpio-ranges
device-tree property and removes no more needed properties. Also it
merges the previously proposed driver in the existing simple-amplifier
driver.

In order to ease the review, I choose to split modifications related
to the merge of the gpio-audio-amp part into the simple-amplfier driver
in several commits.

Best regards,
Hervé

Changes v1 -> v2
  v1: https://lore.kernel.org/all/20260330101610.57942-1-herve.codina@bootlin.com/

  Rebase on top of v7.1-rc1.

  Patch 1:
  - Add 'Acked-by: Rob Herring'

  Patch 2:
  - Use gpio-audio-amp-* instead of audio-gpio-amp
  - Introduce mono/stereo channel distinction with gpio-audio-amp-mono
    and gpio-audio-amp-stereo compatible strings (needed if the
    "simple-amplifier" compatible string is deprecated in the near
    future).
  - Reduce the maximum numbers of gpios used for gain setting to 16.
  - Use amplifier-N instead of amplifierN in examples
  - Introduce gpio-ranges property and remove the no more needed
    gpio-points and gpio-range properties

  Other patches (full rework):
  - Merge the new audio-gpio-amp driver provided in v1 into the
    existing simple-amplifier driver.
  - Slit modification in several commits.
  - Reduce the maximum number of gpios used for gain setting to 16.
  - Fix a memory leak in case of error in simple_amp_multi_add_kcontrol()
    (Reported by Shahiko).
  - Handle the new gpio-ranges property and drop the support for the no
    more needed properties (gpio-points and gpio-range).
  - Update author and copyright.

Herve Codina (17):
  of: Introduce of_property_read_s32_index()
  ASoC: dt-bindings: Add support for the GPIOs driven amplifier
  ASoC: simple-amplifier: Remove DRV_NAME defined value
  ASoC: simple-amplifier: Add missing headers
  ASoC: simple-amplifier: Remove CONFIG_OF flag and of_match_ptr()
  ASoC: simple-amplifier: Rename drv_event() function
  ASoC: simple-amplifier: Use 'simple_amp' variable name instead of
    'priv'
  ASoC: simple-amplifier: Remove DAPM widgets and routes from the ASoC
    component driver
  ASoC: simple-amplifier: Introduce support for gpio-audio-amp
  ASoC: simple-amplifier: gpio-audio-amp: Add support for extra power
    supplies
  ASoC: simple-amplifier: gpio-audio-amp: Add support for mute gpio
  ASoC: simple-amplifier: gpio-audio-amp: Add support for bypass gpio
  ASoC: simple-amplifier: gpio-audio-amp: Add support for basic gain
  ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-ranges
  ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-labels
  ASoC: simple-amplifier: Update author and copyright
  MAINTAINERS: Add the ASoC gpio audio amplifier entry

 .../bindings/sound/gpio-audio-amp.yaml        | 270 ++++++
 MAINTAINERS                                   |   7 +
 include/linux/of.h                            |   7 +
 sound/soc/codecs/simple-amplifier.c           | 907 +++++++++++++++++-
 4 files changed, 1165 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml

-- 
2.53.0



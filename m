Return-Path: <linux-gpio+bounces-34173-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOfnJTRYxGkCygQAu9opvQ
	(envelope-from <linux-gpio+bounces-34173-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 22:48:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4332CAE2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 22:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A1143066436
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 21:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B491D3A873E;
	Wed, 25 Mar 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtbI2QDA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644A2773DE;
	Wed, 25 Mar 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774475201; cv=none; b=ZpEVy+Aea3rozCJ9iWu58HxVDp9RetvgfNIZwybZ/PoKOZHa1Yqp3RGdfaXxG5J+Xrp1sbM4jVfdWsUSBAnD+VQNzbwCSj+QhPAbIfhRdAO/jIXqyYG3PJHiSI6+mrgpL3DVSJC6cxo19K37sXFvk355GYWncsoiExqlC7acUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774475201; c=relaxed/simple;
	bh=+ylu7bl+NpdgEU9QdSwkI5coZAZII7MT6smUgsFVfkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fqMl6wrW79oxfyzoyYPmOZvgeh/upyt187L+wC0p4sZP55oF3Tmda1uf4rWfe5VuBwH4qRKuYExq1muccMxa0cmdjfjusGV0s1oimWJZNJDQXFTrqtYd08Yjv0QYtObnP08fkCfsr1OTi5iY0RFFJVYqk2113+f9wJ8irI2RPFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtbI2QDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD43C19423;
	Wed, 25 Mar 2026 21:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774475201;
	bh=+ylu7bl+NpdgEU9QdSwkI5coZAZII7MT6smUgsFVfkE=;
	h=From:Date:Subject:To:Cc:From;
	b=WtbI2QDAHRGy7hBuTjIP69MfxHOXAyGzvoMrNsp5XBNMRZ0XQDqzpD4vUBAxrCyga
	 nlN6Pr3ryI8AZyTxfkNzMcJlhfL4rI0rE0drpazFPfDbXqBXKcAcxAkCKGkxIPr9+n
	 6L0SzBNgPMMWcJgsxIBRVgJiY1zNmtatn67QSRW6oCwtyMVuO2+3oF2je1hw3jIQwP
	 NPGxGgaLR8cw6BkIIgyJUxbKOTmTTIyGbTvl15XuLsa6h8NoXay/TkactMoDeMnztm
	 iRq3NB/u0fvu0v0FecAPfRgx2NkA5UQYWVTHYTLhUdsFakvQi+PDE52AvtI9+kuXzY
	 pJ0aeyb1ow4cw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Mar 2026 22:46:36 +0100
Subject: [PATCH] RFT: x86_32: Move OLPC XO-1 audio GPIO to software nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-asoc-olpc-v1-1-ebe6de05c7e2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NL3cTi/GTd/JyCZN20NEPT5DRDSxMjgyQloPqCotS0zAqwWdGxtbU
 A1yljK1sAAAA=
X-Change-ID: 20260319-asoc-olpc-ff15cf19420b
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Jaya Kumar <jayakumar.alsa@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34173-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41D4332CAE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This needs real hardware to continue.

At the TODO spot, we need the name of the actual
PCI device providing the cs5535 device.

If we can get this working, we can move over the rest
of the hogs etc to software nodes and get rid of all
the custom cs5535_gpio_set(), cs5535_gpio_clear()
etc.

If it turns out that no-one is willing to actually
test OLPC XO-1 patches, I will follow up with a patch
to just delete the XO-1 support altogether.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/x86/platform/olpc/olpc.c            | 33 ++++++++++++++++++++++++++++++++
 sound/pci/cs5535audio/cs5535audio.c      |  3 +--
 sound/pci/cs5535audio/cs5535audio.h      | 26 +++++++++++++------------
 sound/pci/cs5535audio/cs5535audio_olpc.c | 32 +++++++++++++++----------------
 sound/pci/cs5535audio/cs5535audio_pcm.c  |  4 ++--
 5 files changed, 66 insertions(+), 32 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc.c b/arch/x86/platform/olpc/olpc.c
index 1d4a00e767ec..95df7f691825 100644
--- a/arch/x86/platform/olpc/olpc.c
+++ b/arch/x86/platform/olpc/olpc.c
@@ -10,6 +10,8 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/delay.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/io.h>
 #include <linux/string.h>
 #include <linux/platform_device.h>
@@ -17,6 +19,7 @@
 #include <linux/syscore_ops.h>
 #include <linux/mutex.h>
 #include <linux/olpc-ec.h>
+#include <linux/property.h>
 
 #include <asm/geode.h>
 #include <asm/setup.h>
@@ -283,6 +286,32 @@ static struct olpc_ec_driver ec_xo1_5_driver = {
 #endif
 };
 
+/*
+ * Create software nodes for GPIO look-ups so we can keep the
+ * CS5535 GPIO driver abstract without peeking under the hood.
+ */
+static const struct software_node cs5535_gpiochip_node = {
+	.name = "cs5535-gpio",
+};
+
+static const struct property_entry olpc_snd_props[] = {
+	PROPERTY_ENTRY_GPIO("mic-ac-gpios", &cs5535_gpiochip_node,
+			    OLPC_GPIO_MIC_AC, GPIO_ACTIVE_HIGH),
+	{}
+};
+
+static const struct software_node olpc_snd_node = {
+	/* TODO: dev_name(&pci->dev) for the OLPC CS5535 PCI device */
+	.name = "",
+	.properties = olpc_snd_props,
+};
+
+static const struct software_node *olpc_sw_nodes[] = {
+	&cs5535_gpiochip_node,
+	&olpc_snd_node,
+	NULL
+};
+
 static int __init olpc_init(void)
 {
 	int r = 0;
@@ -315,6 +344,10 @@ static int __init olpc_init(void)
 			return r;
 	}
 
+	r = software_node_register_node_group(olpc_sw_nodes);
+	if (r)
+		return r;
+
 	return 0;
 }
 
diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 0ebf6c02b1ef..676c540d03eb 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -164,7 +164,7 @@ static int snd_cs5535audio_mixer(struct cs5535audio *cs5535au)
 
 	snd_ac97_tune_hardware(cs5535au->ac97, ac97_quirks, ac97_quirk);
 
-	err = olpc_quirks(card, cs5535au->ac97);
+	err = olpc_quirks(card, cs5535au);
 	if (err < 0) {
 		dev_err(card->dev, "olpc quirks failed\n");
 		return err;
@@ -241,7 +241,6 @@ static irqreturn_t snd_cs5535audio_interrupt(int irq, void *dev_id)
 
 static void snd_cs5535audio_free(struct snd_card *card)
 {
-	olpc_quirks_cleanup();
 }
 
 static int snd_cs5535audio_create(struct snd_card *card,
diff --git a/sound/pci/cs5535audio/cs5535audio.h b/sound/pci/cs5535audio/cs5535audio.h
index d84620a0c26c..f917fc21533a 100644
--- a/sound/pci/cs5535audio/cs5535audio.h
+++ b/sound/pci/cs5535audio/cs5535audio.h
@@ -2,6 +2,8 @@
 #ifndef __SOUND_CS5535AUDIO_H
 #define __SOUND_CS5535AUDIO_H
 
+#include <linux/gpio/consumer.h>
+
 #define cs_writel(cs5535au, reg, val)	outl(val, (cs5535au)->port + reg)
 #define cs_writeb(cs5535au, reg, val)	outb(val, (cs5535au)->port + reg)
 #define cs_readl(cs5535au, reg)		inl((cs5535au)->port + reg)
@@ -93,6 +95,7 @@ struct cs5535audio {
 	struct snd_pcm_substream *playback_substream;
 	struct snd_pcm_substream *capture_substream;
 	struct cs5535audio_dma dmas[NUM_CS5535AUDIO_DMAS];
+	struct gpio_desc *mic_ac;
 };
 
 extern const struct dev_pm_ops snd_cs5535audio_pm;
@@ -100,25 +103,24 @@ extern const struct dev_pm_ops snd_cs5535audio_pm;
 #ifdef CONFIG_OLPC
 void olpc_prequirks(struct snd_card *card,
 		    struct snd_ac97_template *ac97);
-int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97);
-void olpc_quirks_cleanup(void);
-void olpc_analog_input(struct snd_ac97 *ac97, int on);
+int olpc_quirks(struct snd_card *card, struct cs5535audio *cs5535au);
+void olpc_analog_input(struct cs5535audio *cs5535au, int on);
 void olpc_mic_bias(struct snd_ac97 *ac97, int on);
 
-static inline void olpc_capture_open(struct snd_ac97 *ac97)
+static inline void olpc_capture_open(struct cs5535audio *cs5535au)
 {
 	/* default to Analog Input off */
-	olpc_analog_input(ac97, 0);
+	olpc_analog_input(cs5535au, 0);
 	/* enable MIC Bias for recording */
-	olpc_mic_bias(ac97, 1);
+	olpc_mic_bias(cs5535au->ac97, 1);
 }
 
-static inline void olpc_capture_close(struct snd_ac97 *ac97)
+static inline void olpc_capture_close(struct cs5535audio *cs5535au)
 {
 	/* disable Analog Input */
-	olpc_analog_input(ac97, 0);
+	olpc_analog_input(cs5535au, 0);
 	/* disable the MIC Bias (so the recording LED turns off) */
-	olpc_mic_bias(ac97, 0);
+	olpc_mic_bias(cs5535au->ac97, 0);
 }
 #else
 static inline void olpc_prequirks(struct snd_card *card,
@@ -128,10 +130,10 @@ static inline int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97)
 	return 0;
 }
 static inline void olpc_quirks_cleanup(void) { }
-static inline void olpc_analog_input(struct snd_ac97 *ac97, int on) { }
+static inline void olpc_analog_input(struct cs5535audio *cs5535au, int on) { }
 static inline void olpc_mic_bias(struct snd_ac97 *ac97, int on) { }
-static inline void olpc_capture_open(struct snd_ac97 *ac97) { }
-static inline void olpc_capture_close(struct snd_ac97 *ac97) { }
+static inline void olpc_capture_open(struct cs5535audio *cs5535au) { }
+static inline void olpc_capture_close(struct cs5535audio *cs5535au) { }
 #endif
 
 int snd_cs5535audio_pcm(struct cs5535audio *cs5535audio);
diff --git a/sound/pci/cs5535audio/cs5535audio_olpc.c b/sound/pci/cs5535audio/cs5535audio_olpc.c
index 122170a410d9..19eed3c9c48b 100644
--- a/sound/pci/cs5535audio/cs5535audio_olpc.c
+++ b/sound/pci/cs5535audio/cs5535audio_olpc.c
@@ -9,7 +9,7 @@
 #include <sound/info.h>
 #include <sound/control.h>
 #include <sound/ac97_codec.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <asm/olpc.h>
 #include "cs5535audio.h"
@@ -21,8 +21,9 @@
  * It has an Analog Input mode that is switched into (after disabling the
  * High Pass Filter) via GPIO.  It is supported on B2 and later models.
  */
-void olpc_analog_input(struct snd_ac97 *ac97, int on)
+void olpc_analog_input(struct cs5535audio *cs5535au, int on)
 {
+	struct snd_ac97 *ac97 = cs5535au->ac97;
 	int err;
 
 	if (!machine_is_olpc())
@@ -38,7 +39,7 @@ void olpc_analog_input(struct snd_ac97 *ac97, int on)
 	}
 
 	/* set Analog Input through GPIO */
-	gpio_set_value(OLPC_GPIO_MIC_AC, on);
+	gpiod_set_value(cs5535au->mic_ac, on);
 }
 
 /*
@@ -70,7 +71,9 @@ static int olpc_dc_info(struct snd_kcontrol *kctl,
 
 static int olpc_dc_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
 {
-	v->value.integer.value[0] = gpio_get_value(OLPC_GPIO_MIC_AC);
+	struct cs5535audio *cs5535au = snd_kcontrol_chip(kctl);
+
+	v->value.integer.value[0] = gpiod_get_value(cs5535au->mic_ac);
 	return 0;
 }
 
@@ -78,7 +81,7 @@ static int olpc_dc_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
 {
 	struct cs5535audio *cs5535au = snd_kcontrol_chip(kctl);
 
-	olpc_analog_input(cs5535au->ac97, v->value.integer.value[0]);
+	olpc_analog_input(cs5535au, v->value.integer.value[0]);
 	return 1;
 }
 
@@ -141,19 +144,22 @@ void olpc_prequirks(struct snd_card *card,
 		ac97->scaps |= AC97_SCAP_INV_EAPD;
 }
 
-int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97)
+int olpc_quirks(struct snd_card *card, struct cs5535audio *cs5535au)
 {
+	struct snd_ac97 *ac97 = cs5535au->ac97;
 	struct snd_ctl_elem_id elem;
 	int i, err;
 
 	if (!machine_is_olpc())
 		return 0;
 
-	if (gpio_request(OLPC_GPIO_MIC_AC, DRV_NAME)) {
-		dev_err(card->dev, "unable to allocate MIC GPIO\n");
-		return -EIO;
+	cs5535au->mic_ac = devm_gpiod_get_optional(card->dev, "mic-ac",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(cs5535au->mic_ac)) {
+		dev_err(card->dev, "unable to allocate MIC AC GPIO\n");
+		return PTR_ERR(cs5535au->mic_ac);
 	}
-	gpio_direction_output(OLPC_GPIO_MIC_AC, 0);
+	gpiod_set_consumer_name(cs5535au->mic_ac, DRV_NAME);
 
 	/* drop the original AD1888 HPF control */
 	memset(&elem, 0, sizeof(elem));
@@ -179,9 +185,3 @@ int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97)
 	olpc_mic_bias(ac97, 0);
 	return 0;
 }
-
-void olpc_quirks_cleanup(void)
-{
-	if (machine_is_olpc())
-		gpio_free(OLPC_GPIO_MIC_AC);
-}
diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 48b99a07e3bc..49b1efb93dd9 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -341,14 +341,14 @@ static int snd_cs5535audio_capture_open(struct snd_pcm_substream *substream)
 					    SNDRV_PCM_HW_PARAM_PERIODS);
 	if (err < 0)
 		return err;
-	olpc_capture_open(cs5535au->ac97);
+	olpc_capture_open(cs5535au);
 	return 0;
 }
 
 static int snd_cs5535audio_capture_close(struct snd_pcm_substream *substream)
 {
 	struct cs5535audio *cs5535au = snd_pcm_substream_chip(substream);
-	olpc_capture_close(cs5535au->ac97);
+	olpc_capture_close(cs5535au);
 	return 0;
 }
 

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260319-asoc-olpc-ff15cf19420b

Best regards,
-- 
Linus Walleij <linusw@kernel.org>



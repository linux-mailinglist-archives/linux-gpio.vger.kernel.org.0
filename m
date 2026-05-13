Return-Path: <linux-gpio+bounces-36727-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGHzIIA0BGoqFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36727-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:21:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E44752F82E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 10:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36DD4308A582
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF503B0AE1;
	Wed, 13 May 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iT8MTGpv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74C3AE1A9;
	Wed, 13 May 2026 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660274; cv=none; b=a9pbhzhJo0ds7hF9NUqZbG8Ki9zEvjOrDykitx589Hida6wBOzZJCLYqikNwCvi/hXvGu6JOHhtMDQDY+N0qmtJUE0+W709syrmyMdVZg9YBci7fw0+4oTThBpPYnO3A5z0+/g/jVpx0vUhhjGJ6XrXJ+DkcdgWIdEzXbyORaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660274; c=relaxed/simple;
	bh=Sv6+N5Zt1O8orZuQwpvNBNZT5Z1+RinlN6oUfSIb6F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScJNtHh9OR7kFZK0cObvlhvWaIYlOJQODKiB3Mwexfmdy4uDPUIEUNaZR3eO57B+OawT/2jHjXVqiKFg9GCuQ2eAtSzn+liAO7/3131qw2vFiPyB6sOhWZkGh4KQy19W7Db7xkejdCNiZSNdul0fjrvWy7H51weFQOMwsiTjuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iT8MTGpv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E56814E42C8F;
	Wed, 13 May 2026 08:17:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5D58606CE;
	Wed, 13 May 2026 08:17:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B10611AF874F;
	Wed, 13 May 2026 10:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660268; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=l1y3fIm4ahJOfHQ1HJkg+g3roaTNfBGJSD2gCPJQfgk=;
	b=iT8MTGpv2VXou8NJWCDaocrF8d8oP26S+MkN0t+2kciDn0wXSALu8Xu8lEnG7EoqtVusn5
	eaqSxBJpZAZwnCyM9/IIUoJEFi5KK1biHdK0mbfJMBj4YsL4GFNKJctmKUlovWUx7OFS4g
	IYbUp3L9iib/Gth4Yhp008pQdMXPuhHfxQeYky4X8mTLsWs0Kjsi0mtZLRQ3RJRIF1VMOt
	ht1/kv+9J+7taZ1BGhr6owHf1Vwpkqo6IMmgjAtkqQOSddwf+0XylmXVS2v7PRYyjWdVW9
	wD7t6HyISIuzwoITK2r1HBeZZtFu/ktADc7C9Gh52OAfTVDnIvYK8HWwTyIKUQ==
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
Subject: [PATCH v3 14/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-ranges
Date: Wed, 13 May 2026 10:16:58 +0200
Message-ID: <20260513081702.317117-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 6E44752F82E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36727-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The mapping between physical gain values and gpio values can be
expressed using ranges described in the gain-ranges property.

This gain-ranges property is an array of ranges.

Each range in the array is defined by the first point and last point in
the range. Those points are a pair of values, the gpios value and the
related gain (dB) value.

With that, a given range defines N possible items (from the first point
gpios value to the last point gpios value) in order to set a gain from
the first point gain value to the last point gain value.

Handle this description and the related kcontrol.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 317 +++++++++++++++++++++++++++-
 1 file changed, 312 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 5b172e520dcd..5759f9bc2f4f 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -7,11 +7,16 @@
 #include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/gpio/consumer.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 #include <sound/soc.h>
+#include <linux/sort.h>
+#include <sound/tlv.h>
 
 struct simple_amp_single {
 	struct gpio_desc *gpio;
@@ -20,11 +25,35 @@ struct simple_amp_single {
 	const char *control_name;
 };
 
+struct simple_amp_point {
+	u32 gpio_val;
+	int gain_db;
+};
+
+struct simple_amp_range {
+	unsigned int nb_points;
+	struct simple_amp_point min;
+	struct simple_amp_point max;
+};
+
+struct simple_amp_ranges {
+	unsigned int nb_ranges;
+	struct simple_amp_range *tab_ranges;
+};
+
+enum simple_amp_mode {
+	SIMPLE_AMP_MODE_NONE,
+	SIMPLE_AMP_MODE_RANGES,
+};
+
 struct simple_amp_multi {
 	struct gpio_descs *gpios;
 	u32 kctrl_val;
 	u32 kctrl_max;
 	const char *control_name;
+	unsigned int *tlv_array;
+	enum simple_amp_mode mode;
+	struct simple_amp_ranges ranges;
 };
 
 struct simple_amp_data {
@@ -195,6 +224,32 @@ static int simple_amp_single_add_kcontrol(struct snd_soc_component *component,
 	return snd_soc_add_component_controls(component, &control, 1);
 }
 
+static u32 simple_amp_multi_ranges_kctrl_to_gpio(u32 kctrl_val,
+						 struct simple_amp_ranges *ranges)
+{
+	struct simple_amp_range *range;
+	u32 index = kctrl_val;
+	unsigned int i;
+
+	for (i = 0; i < ranges->nb_ranges; i++) {
+		range = &ranges->tab_ranges[i];
+
+		if (index < range->nb_points)
+			return (range->max.gpio_val >= range->min.gpio_val) ?
+				range->min.gpio_val + index :
+				range->min.gpio_val - index;
+
+		index -= range->nb_points;
+	}
+
+	/*
+	 * Given index out of possible ranges. This is shouldn't happen.
+	 * Signal the issue and return the maximum value
+	 */
+	WARN(1, "kctrl_val %u out of ranges\n", kctrl_val);
+	return ranges->tab_ranges[ranges->nb_ranges - 1].max.gpio_val;
+}
+
 static int simple_amp_multi_kctrl_write_gpios(struct simple_amp_multi *multi,
 					      u32 kctrl_val)
 {
@@ -204,7 +259,12 @@ static int simple_amp_multi_kctrl_write_gpios(struct simple_amp_multi *multi,
 	if (kctrl_val > multi->kctrl_max)
 		return -EINVAL;
 
-	gpio_val = kctrl_val;
+	if (multi->mode == SIMPLE_AMP_MODE_RANGES)
+		gpio_val = simple_amp_multi_ranges_kctrl_to_gpio(kctrl_val,
+								 &multi->ranges);
+	else
+		gpio_val = kctrl_val;
+
 	bitmap_from_arr32(bm, &gpio_val, multi->gpios->ndescs);
 
 	return gpiod_multi_set_value_cansleep(multi->gpios, bm);
@@ -252,6 +312,38 @@ static int simple_amp_multi_kctrl_int_put(struct snd_kcontrol *kcontrol,
 	return 1; /* The value changed */
 }
 
+static unsigned int *simple_amp_alloc_tlv_ranges(const struct simple_amp_ranges *ranges)
+{
+	unsigned int index;
+	unsigned int *tlv;
+	unsigned int *t;
+	unsigned int i;
+
+	tlv = kzalloc_objs(*tlv, 2 + ranges->nb_ranges * 6, GFP_KERNEL);
+	if (!tlv)
+		return NULL;
+
+	t = tlv;
+
+	/* Fill first TLV */
+	*t++ = SNDRV_CTL_TLVT_DB_RANGE; /* Tag */
+	*t++ = ranges->nb_ranges * 6 * sizeof(*tlv); /* Len */
+	/* Ranges are sorted from lower to higher value */
+	index = 0;
+	for (i = 0; i < ranges->nb_ranges; i++) {
+		/* Fill range item i */
+		*t++ = index;  /* min */
+		index += ranges->tab_ranges[i].nb_points;
+		*t++ = index - 1;  /* max */
+		*t++ = SNDRV_CTL_TLVT_DB_MINMAX; /* Tag */
+		*t++ = 2 * sizeof(*tlv); /* Len */
+		*t++ = ranges->tab_ranges[i].min.gain_db; /* min_dB */
+		*t++ = ranges->tab_ranges[i].max.gain_db; /* max_dB */
+	}
+
+	return tlv;
+}
+
 static int simple_amp_multi_add_kcontrol(struct snd_soc_component *component,
 					 struct simple_amp_multi *multi)
 {
@@ -265,12 +357,39 @@ static int simple_amp_multi_add_kcontrol(struct snd_soc_component *component,
 	};
 	int ret;
 
+	switch (multi->mode) {
+	case SIMPLE_AMP_MODE_RANGES:
+		multi->tlv_array = simple_amp_alloc_tlv_ranges(&multi->ranges);
+		if (!multi->tlv_array)
+			return -ENOMEM;
+
+		control.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |
+				 SNDRV_CTL_ELEM_ACCESS_READWRITE;
+		control.tlv.p = multi->tlv_array;
+		break;
+
+	case SIMPLE_AMP_MODE_NONE:
+		/* Already set control configuration is enough */
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
 	/* Be consistent between multi->kctrl_val value and the GPIOs value */
 	ret = simple_amp_multi_kctrl_write_gpios(multi, multi->kctrl_val);
 	if (ret)
-		return ret;
+		goto err_free_tlv_array;
 
-	return snd_soc_add_component_controls(component, &control, 1);
+	ret = snd_soc_add_component_controls(component, &control, 1);
+	if (ret)
+		goto err_free_tlv_array;
+
+	return 0;
+
+err_free_tlv_array:
+	kfree(multi->tlv_array);
+	return ret;
 }
 
 static int simple_amp_add_basic_dapm(struct snd_soc_component *component)
@@ -407,8 +526,17 @@ static int simple_amp_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static void simple_amp_component_remove(struct snd_soc_component *component)
+{
+	struct simple_amp *simple_amp = snd_soc_component_get_drvdata(component);
+
+	kfree(simple_amp->gain.tlv_array);
+	simple_amp->gain.tlv_array = NULL;
+}
+
 static const struct snd_soc_component_driver simple_amp_component_driver = {
 	.probe = simple_amp_component_probe,
+	.remove = simple_amp_component_remove,
 };
 
 static int simple_amp_parse_single_gpio(struct device *dev,
@@ -426,10 +554,179 @@ static int simple_amp_parse_single_gpio(struct device *dev,
 	return 0;
 }
 
+static int simple_amp_cmp_ranges(const void *a, const void *b)
+{
+	const struct simple_amp_range *a_range = a;
+	const struct simple_amp_range *b_range = b;
+
+	/* Ranges a and b don't overlap. This has been already checked */
+
+	return a_range->min.gain_db - b_range->max.gain_db;
+}
+
+static int simple_amp_check_new_range(const struct simple_amp_range *new_range,
+				      const struct simple_amp_range *tab_ranges,
+				      unsigned int nb_ranges)
+{
+	unsigned int i;
+
+	for (i = 0; i < nb_ranges; i++) {
+		/* Check for range overlaps */
+		if (new_range->min.gain_db >= tab_ranges[i].min.gain_db &&
+		    new_range->min.gain_db <= tab_ranges[i].max.gain_db)
+			return -EINVAL;
+
+		if (new_range->max.gain_db >= tab_ranges[i].min.gain_db &&
+		    new_range->max.gain_db <= tab_ranges[i].max.gain_db)
+			return -EINVAL;
+
+		if (new_range->min.gain_db <= tab_ranges[i].min.gain_db &&
+		    new_range->max.gain_db >= tab_ranges[i].max.gain_db)
+			return -EINVAL;
+	}
+	return 0;
+}
+
+static int simple_amp_parse_ranges(struct device *dev,
+				   struct simple_amp_multi *multi,
+				   const char *ranges_property)
+{
+	struct simple_amp_ranges *ranges = &multi->ranges;
+	struct simple_amp_range *range;
+	struct device_node *np = dev->of_node;
+	struct simple_amp_point first_point;
+	unsigned int max_gpio_val;
+	unsigned int i;
+	int ret;
+	u32 u;
+	s32 s;
+
+	max_gpio_val = (1 << multi->gpios->ndescs) - 1;
+
+	ret = of_property_count_u32_elems(np, ranges_property);
+	if (ret < 0)
+		return ret;
+
+	/* The ranges array cannot be empty */
+	if (ret == 0)
+		return -EINVAL;
+	/*
+	 * One range item is composed of 2 points and each point is composed of
+	 * 2 values.
+	 */
+	if (ret % 4)
+		return -EINVAL;
+
+	ranges->nb_ranges = ret / 4;
+
+	/* The worst case is one range per possible gpio value */
+	if (ranges->nb_ranges > max_gpio_val + 1)
+		return -EINVAL;
+
+	ranges->tab_ranges = devm_kcalloc(dev, ranges->nb_ranges,
+					  sizeof(*ranges->tab_ranges),
+					  GFP_KERNEL);
+	if (!ranges->tab_ranges)
+		return -ENOMEM;
+
+	multi->kctrl_max = 0;
+	for (i = 0; i < ranges->nb_ranges; i++) {
+		range = &ranges->tab_ranges[i];
+
+		/* First gpios value */
+		ret = of_property_read_u32_index(np, ranges_property, i * 4, &u);
+		if (ret)
+			return ret;
+		if (u > max_gpio_val)
+			return -EINVAL;
+
+		range->min.gpio_val = u;
+
+		/* First Gain value */
+		ret = of_property_read_s32_index(np, ranges_property, i * 4 + 1, &s);
+		if (ret)
+			return ret;
+
+		range->min.gain_db = s;
+
+		/* Second gpios value */
+		ret = of_property_read_u32_index(np, ranges_property, i * 4 + 2, &u);
+		if (ret)
+			return ret;
+		if (u > max_gpio_val)
+			return -EINVAL;
+
+		range->max.gpio_val = u;
+
+		/* Second Gain value */
+		ret = of_property_read_s32_index(np, ranges_property, i * 4 + 3, &s);
+		if (ret)
+			return ret;
+
+		range->max.gain_db = s;
+
+		/* Save the first point for later usage */
+		if (i == 0)
+			first_point = range->min;
+
+		/* Fix min and max if needed */
+		if (range->min.gain_db > range->max.gain_db)
+			swap(range->min, range->max);
+
+		ret = simple_amp_check_new_range(range, ranges->tab_ranges, i);
+		if (ret)
+			return ret;
+
+		range->nb_points = abs_diff(range->min.gpio_val,
+					    range->max.gpio_val) + 1;
+
+		multi->kctrl_max += range->nb_points;
+	}
+
+	multi->kctrl_max -= 1;
+
+	/* Sort the tab_range array by gain_db value */
+	sort(ranges->tab_ranges, ranges->nb_ranges, sizeof(*ranges->tab_ranges),
+	     simple_amp_cmp_ranges, NULL);
+
+	/*
+	 * multi->kctrl_val is the index in tab_ranges.
+	 *
+	 * Choose to have the initial amplification value set to the first point
+	 * available in the first range available in the tab_ranges array before
+	 * sorting.
+	 *
+	 * This first point has been identified before sorting. Search for it in
+	 * the sorted array in order to set the multi->kctrl_val initial value.
+	 */
+	multi->kctrl_val = 0;
+	for (i = 0; i < ranges->nb_ranges; i++) {
+		range = &ranges->tab_ranges[i];
+
+		if (range->min.gpio_val == first_point.gpio_val &&
+		    range->min.gain_db == first_point.gain_db)
+			break;
+
+		multi->kctrl_val += range->nb_points;
+
+		if (range->max.gpio_val == first_point.gpio_val &&
+		    range->max.gain_db == first_point.gain_db) {
+			multi->kctrl_val--;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int simple_amp_parse_multi_gpio(struct device *dev,
 				       struct simple_amp_multi *multi,
-				       const char *gpios_property)
+				       const char *gpios_property,
+				       const char *ranges_property)
 {
+	struct device_node *np = dev->of_node;
+	int ret;
+
 	/* Start with the value 0 (GPIO inactive). Can be changed later */
 	multi->kctrl_val = 0;
 	multi->gpios = devm_gpiod_get_array_optional(dev, gpios_property, GPIOD_OUT_LOW);
@@ -448,6 +745,15 @@ static int simple_amp_parse_multi_gpio(struct device *dev,
 	/* Set default value for the kctrl_max. Can be changed later */
 	multi->kctrl_max = (1 << multi->gpios->ndescs) - 1;
 
+	multi->mode = SIMPLE_AMP_MODE_NONE;
+	if (of_property_present(np, ranges_property)) {
+		ret = simple_amp_parse_ranges(dev, multi, ranges_property);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to parse '%s'\n",
+					     ranges_property);
+		multi->mode = SIMPLE_AMP_MODE_RANGES;
+	}
+
 	return 0;
 }
 
@@ -485,7 +791,8 @@ static int simple_amp_probe(struct platform_device *pdev)
 	}
 
 	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_PGA) {
-		ret = simple_amp_parse_multi_gpio(dev, &simple_amp->gain, "gain");
+		ret = simple_amp_parse_multi_gpio(dev, &simple_amp->gain, "gain",
+						  "gain-ranges");
 		if (ret)
 			return ret;
 	}
-- 
2.54.0



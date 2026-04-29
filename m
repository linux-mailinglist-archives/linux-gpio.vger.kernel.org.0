Return-Path: <linux-gpio+bounces-35771-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAE3L0O48WngjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35771-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:50:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF95490C29
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CDDE3057C62
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED84F3BA25C;
	Wed, 29 Apr 2026 07:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hlMwPf7d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA31D3BAD88;
	Wed, 29 Apr 2026 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448692; cv=none; b=YQnwSXTyF5SwtKj7DJnNsUP+QisNiHe7B1AIFwSYYhjGfpcppMKe/2tCcAIQ0dj+imBHxKH8S3Pcvk6ZTFZl9OFag00na+Enljzodes9ZRrOrznPeSnzy+E1kGmAFGUbML+Mt/qRdVeJMQAFeiNxbZAfGHA0AB397YgL9tsZFq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448692; c=relaxed/simple;
	bh=c54ycmmXNL7RxkCfzxWn0i8aq65sjwGiQUFNX+2OQc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZmaHQDNmArj+wuQykFsBTqC8+pMxPrRSuxUC7vQqrPwukX2kEGyJr1co8KNC4JEuBT4JUNsduYAY1B37OWZUKWmqevafCsH8Zz8vi/sIHxiMDe2r/qVQMWPcAT7a0Fj13FBJfTJv9GnQtONVZcWi4u24K+0Vjj/7phsntKs3tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hlMwPf7d; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DEC31A347A;
	Wed, 29 Apr 2026 07:44:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32FA1601DF;
	Wed, 29 Apr 2026 07:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB8E91072989F;
	Wed, 29 Apr 2026 09:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448687; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3G44daaR6HwKqj68j84FK3yKhXwmvmSMQaPXApsQR/4=;
	b=hlMwPf7dwECvlQTBLo/FhK1gUjmiq8mx7esMjGjIH2jHjo7BvEYB8XrIT17/Kq4iQLH7Vz
	meu5Zq4o56jak1sN44iLh8HLvWKiNr40hBg8yAGaCn52W0H8eh7qIA7sglcWfGbDtPQ7Yn
	Y6gdc+LMfMMObqWjAX90UFoqL3iZNS7STt8KJt05LHNh6rxcdlLB48GaXDNZCG0ad5XcDw
	WtGFUinknqRcYlCpxkz6wQIEsNcFZmznjaD+DIJG08W5jx17tr5iTlg9Uw5n21QEv9ROvL
	Sr5c2zSn1v4PYFQ5L75zmiPQRoOf2+gvgQlRfchex9CSBY/YG5kkVS+OYaaJfA==
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
Subject: [PATCH v2 14/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-ranges
Date: Wed, 29 Apr 2026 09:43:50 +0200
Message-ID: <20260429074356.118420-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429074356.118420-1-herve.codina@bootlin.com>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 8CF95490C29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35771-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]

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
 sound/soc/codecs/simple-amplifier.c | 310 +++++++++++++++++++++++++++-
 1 file changed, 305 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 4f4a3c10f883..b25332a76549 100644
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
 
+static int *simple_amp_alloc_tlv_ranges(const struct simple_amp_ranges *ranges)
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
@@ -426,10 +554,172 @@ static int simple_amp_parse_single_gpio(struct device *dev,
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
+	if (ret <= 0)
+		return ret;
+
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
@@ -448,6 +738,15 @@ static int simple_amp_parse_multi_gpio(struct device *dev,
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
 
@@ -485,7 +784,8 @@ static int simple_amp_probe(struct platform_device *pdev)
 	}
 
 	if (simple_amp->data->supports & SIMPLE_AUDIO_SUPPORT_PGA) {
-		ret = simple_amp_parse_multi_gpio(dev, &simple_amp->gain, "gain");
+		ret = simple_amp_parse_multi_gpio(dev, &simple_amp->gain, "gain",
+						  "gain-ranges");
 		if (ret)
 			return ret;
 	}
-- 
2.53.0



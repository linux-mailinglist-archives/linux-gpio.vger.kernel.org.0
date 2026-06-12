Return-Path: <linux-gpio+bounces-38394-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IkFsCIOMLGrVSQQAu9opvQ
	(envelope-from <linux-gpio+bounces-38394-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:47:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CBA67CE20
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:47:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oclrRre0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38394-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38394-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BCD2301D03C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB3C3D6496;
	Fri, 12 Jun 2026 22:47:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8313D5674
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:47:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304431; cv=none; b=eWGqDpwZ2NQ0QFFNEZkc8MlRNaAxszVgcjSSuXeINTloY/TRstWcRnns3A8JKxEYdeGfvhMEaVBDmJl3gb2CSIyh1STDAQwK7mM8b0G+ZACe1uXJFc+xPE3oJ29i5UsTpf5qyeWUnARfYlYofvBwt6ABMHA4lP4rQsi9IhlkM/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304431; c=relaxed/simple;
	bh=EsJT2lMotT/uWF+cKzuNO4c+y11rGpYGsfhS1ED7rJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSyxi0H5wa+xutfRe0MyyqQ6ay8dccPONdbOMiDxSmjS+AEU3Dy2N0/b/1WPW2c1SGO7uB0mtMlB5J/+UDZrns6MJd2Y1JfXHKOHa8j7E3P4hc9L9aTLdJMtyxW8DbKDy8mqrszkONE7GHwCQOOconiApexZ1gF+LPYdiIm6H9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oclrRre0; arc=none smtp.client-ip=209.85.221.180
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59d6e44e5c8so1026116e0c.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 15:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781304428; x=1781909228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js/ra5LqzPxNouNNjbCHmWUBqDkuSo6GLF0IH/adVcE=;
        b=oclrRre0kQE7emjth8u8hVeIfsS6xqiPI/WFPlRhkVqagAEP1s813V6mCgM/vyY+aU
         JvagNG06+QuAo7JMZ7l4ARt/lGplyNhS4I9j1sB4jXW7dqwneTPgUOjq1KTUSZoHGxFc
         lgFjEEnfopkDQP56mC/WROmXhHWLnZ4kkmXX0NfQMswtL53XeQKwvOkiaUdv84JCt5IF
         xQZl0vFlOsDbyk2yFGcudsTe8+PAl+7io694nV6SEFvd/4wAovxeoyabWVWkTV3LVJpi
         rUlDUKADS6FoJuiQmzPF10aUQEtwcokZNcSjnsgxOwdW9A8rjn/KwsUdy5RaKzQXNFma
         qT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781304428; x=1781909228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Js/ra5LqzPxNouNNjbCHmWUBqDkuSo6GLF0IH/adVcE=;
        b=mycXFOaAMPs0gZgvnDmLQ4XBFfkQzKzhtTZTjmspqSbMVnVvQDx5lDMYl73ZQUKBvJ
         pgTk6k0VwzskWuIn1qbVxRd4C2RnJfB6RfbV8h+MCDmYPnO7uLmzu33R3tpp2hZEtOZg
         s2W3/BCjfrdCqyQejsxejYCTD674O9s+BTLVv0EMdyevNLHicjy2It5nSO9tBHIfn9mt
         wBtEtrBH8RoC77MdD+gsBmHUPVleQQ9yFFZd8Huo9iFyR3GEd6MbzS5wdGQDJ0g1Emgj
         M75ohhQXcCqpi5LMXcbSZLmZXz8Iep0hYaxFHk5BJX1fna6khCEokTlcnrR1KptGX84W
         iYHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Xy0LYRxl0iZCJSQbIwIm1ReR/7c1i7UOVyDyUlW+pLtPK0F5lLCuqQeeI7gzOE0PgQpqung4aBcot@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIdqH1qwr4gQvE8VpdS3jPw4B9S4iDDdjbEEoTPV3qtZcX7ab
	z0q2sG/IiHuLzNW+ncD/ssgoSiPNQqk3yWSNQ/Vf7t/uLhFSlMymNDhG
X-Gm-Gg: Acq92OHitVrJlSp4zNuz4HMuyNfKlR4mzpb91zv1MaoIokP+/V15+21LfZw/x+mhsWE
	ahhd90vb3wEXy/HQw3l9WVsAsM+N0HkkYWnN9pzb4nj4utEVcO6IWdhpok/T1GeeG5mT7bf/Tk3
	jwPeSsqzrkVWczNJSDLMRHpTk9ftrHcuBiRvF0ZEs3mFKl0waMrKSoMdqWY9etw71rYTmdCal28
	oCENQlhIcbFiytxePcZ9nTqU2Mh6iRIXMQRX+KAyOhcCS3fv9pFmGpDBaUtXwMMp0j8oO622XAh
	dJ7Fmv9b6aIJROWPcBtqsJNC8AHSSOMIvtzdCFsEXuQox6NmCeJA/sSB2b38x+SinHCWCZ2giih
	+BovcVo7JgW4cxvZAce2tGs5dSYy5dEuTWhhwnpgy+uCtId8cBK2HBcWgSNd0Y5oB9CE6rhlTcG
	uQDuF8ssaYDBBRvSY0Dfx+MZSKWSnrZWs3
X-Received: by 2002:a05:6122:1da2:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5bb6c02821bmr3390332e0c.7.1781304428144;
        Fri, 12 Jun 2026 15:47:08 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691fd8adsm4244553e0c.13.2026.06.12.15.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 15:47:07 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 12 Jun 2026 17:46:22 -0500
Subject: [PATCH 4/5] iio: adc: ti-ads1262: Add calibration support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-ads126x-v1-4-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
In-Reply-To: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4008; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=EsJT2lMotT/uWF+cKzuNO4c+y11rGpYGsfhS1ED7rJ4=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFk6PUkHXwQHBh/UZlLZzLP2Zen616qlUzR1la7On31XM
 qzHjVWro5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACYybQEjw2lGLef42wft9aRl
 l79Mvf9rx5Rss9I953/Vzyl39OrYzMjwh3NV+RahVSuPWnw1+/Ii9VPJmfp8Pl+B3zeDDBefSlR
 v5AcA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38394-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:kuurtb@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9CBA67CE20

Add channel calibration support.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 70 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 6d5f22836ad8..b33505e7fdc7 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -217,6 +217,10 @@
 #define ADS1262_RMUX_AVDD_AVSS			4
 #define ADS1262_RMUX_COUNT			5
 
+/* The calibration word is signed 24 bits value */
+#define ADS1262_CALIB_WORD_MAX		((int)(GENMASK(22, 0)))
+#define ADS1262_CALIB_WORD_MIN		(-ADS1262_CALIB_WORD_MAX - 1)
+
 struct ads1262_channel {
 	/* MODE0 */
 	u8 conv_delay:4;
@@ -453,6 +457,32 @@ static int ads1262_dev_start_one(struct ads1262 *st, u8 runmode)
 	return 0;
 }
 
+static int ads1262_read_calib(struct ads1262 *st, unsigned int reg, u32 *val)
+{
+	__le32 lval;
+	int ret;
+
+	/*
+	 * The calibration word is a signed 24 bit LSB-first value.
+	 */
+	ret = regmap_bulk_read(st->regmap, reg, &lval, 3);
+	if (ret)
+		return ret;
+	*val = sign_extend32(le32_to_cpu(lval), 23);
+
+	return 0;
+}
+
+static int ads1262_write_calib(struct ads1262 *st, unsigned int reg, u32 val)
+{
+	__le32 lval = cpu_to_le32(val);
+
+	/*
+	 * The calibration word is a signed 24 bit LSB-first value.
+	 */
+	return regmap_bulk_write(st->regmap, reg, &lval, 3);
+}
+
 static void ads1262_wait_for_conversion(struct ads1262 *st)
 {
 	reinit_completion(&st->drdy);
@@ -673,6 +703,18 @@ static int ads1262_read_raw(struct iio_dev *indio_dev,
 		*val2 = ads1262_conv_delay_avail[mode][1];
 		return IIO_VAL_INT_PLUS_NANO;
 
+	case IIO_CHAN_INFO_CALIBSCALE:
+		ret = ads1262_read_calib(st, ADS1262_FSCAL0_REG, val);
+		if (ret)
+			return ret;
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_CALIBBIAS:
+		ret = ads1262_read_calib(st, ADS1262_OFCAL0_REG, val);
+		if (ret)
+			return ret;
+		return IIO_VAL_INT;
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -682,6 +724,9 @@ static int ads1262_read_avail(struct iio_dev *indio_dev,
 			      struct iio_chan_spec const *chan, const int **vals,
 			      int *type, int *length, long mask)
 {
+	static int calib_range[3] = { ADS1262_CALIB_WORD_MIN, 1,
+				      ADS1262_CALIB_WORD_MAX };
+
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*type = IIO_VAL_INT_PLUS_MICRO;
@@ -701,6 +746,13 @@ static int ads1262_read_avail(struct iio_dev *indio_dev,
 		*length = ARRAY_SIZE(ads1262_conv_delay_avail) * 2;
 		return IIO_AVAIL_LIST;
 
+	case IIO_CHAN_INFO_CALIBSCALE:
+	case IIO_CHAN_INFO_CALIBBIAS:
+		*type = IIO_VAL_INT;
+		*vals = calib_range;
+		*length = ARRAY_SIZE(calib_range);
+		return IIO_AVAIL_RANGE;
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -761,6 +813,18 @@ static int ads1262_write_raw(struct iio_dev *indio_dev,
 
 		break;
 
+	case IIO_CHAN_INFO_CALIBSCALE:
+		if (val > ADS1262_CALIB_WORD_MAX || val < ADS1262_CALIB_WORD_MIN)
+			return -EINVAL;
+
+		return ads1262_write_calib(st, ADS1262_FSCAL0_REG, val);
+
+	case IIO_CHAN_INFO_CALIBBIAS:
+		if (val > ADS1262_CALIB_WORD_MAX || val < ADS1262_CALIB_WORD_MIN)
+			return -EINVAL;
+
+		return ads1262_write_calib(st, ADS1262_OFCAL0_REG, val);
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -867,9 +931,13 @@ static const struct iio_chan_spec ads1262_iio_voltage_template = {
 			      BIT(IIO_CHAN_INFO_HARDWAREGAIN) |
 			      BIT(IIO_CHAN_INFO_SAMP_FREQ) |
 			      BIT(IIO_CHAN_INFO_CONVDELAY),
+	.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_CALIBSCALE) |
+				   BIT(IIO_CHAN_INFO_CALIBBIAS),
 	.info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_HARDWAREGAIN) |
 					     BIT(IIO_CHAN_INFO_SAMP_FREQ) |
-					     BIT(IIO_CHAN_INFO_CONVDELAY),
+					     BIT(IIO_CHAN_INFO_CONVDELAY) |
+					     BIT(IIO_CHAN_INFO_CALIBSCALE) |
+					     BIT(IIO_CHAN_INFO_CALIBBIAS),
 	.ext_info = ads1262_ext_info,
 };
 

-- 
2.54.0



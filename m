Return-Path: <linux-gpio+bounces-40024-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ksRwKiflVWrUuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40024-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:28:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1E751D9C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:28:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=KLtey0pR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40024-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40024-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68B0130519B0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214C03F4100;
	Tue, 14 Jul 2026 07:25:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1623EF650
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013933; cv=none; b=WymeyMHDAdt9TWFG7DF4CXbks4qgHgWArXWLyf2VWq2FbHsACNPwELx4Dm7iDZ9vPlJWn9TUgC5NsfUOJ9VBg/lJi5J9uLNmNaksOrGaJAE+QcCOaSDu7Bpc2ovxtDiAHSRqpy3vYIXC90z8qbHMML/LTofpjw96h0bkYE8OL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013933; c=relaxed/simple;
	bh=kujYGNt7XvMhEZd6iktrLMCpUgQvKZNVtEThnF4x/hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOjdlpI2CC5/4fSwZoTuE4xNXwYAs+uwjSUk87WSiCHoUmuGCzLqfJWbdPVg+Ao+t9Bsm0+JEpOpJJRP4pmFAhvwCvOT3oQucOajwkZSvN/OsPkpxOhAXc/Su3rwWNGPg25kieP5onQslUKpNeviqrgTRtXTpwz5dEGdVuwd0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KLtey0pR; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso3777009f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013931; x=1784618731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6nhkLV0gTH4BitTfM5YVgSjZiXIp7iQInfmkb6/Vsto=;
        b=KLtey0pRqAxvtrRTs8edKx0u0uly7q9KmoXLUjuXSDcz9ess3bkDEAzMFDLy2hHEfJ
         3VowPTCzjNt1nQjbE/eSsjrCt/wqZZbbEzR6qG1gRGxEf5/TUxw7xCGTW7n/F9XQ/Sl4
         GjTPy4+EysyYQs0mVZvvGTKXag8QdNEmo+fI0nKHxXLOqXCYPkpzXD96Mq0sHsidRMsS
         zM1jeVPGPy5F1X9qs05N30i3DU0f2oDymqoS3HDda7Eq0suH62ttDR5pgO87sfnrtKCC
         ATFXFalI8e/pPHrNdQNRWGh05PnrhVpqLJrCQaEW4aQy0+H7B7rtjKn0GgtJbSnACdT7
         q/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013931; x=1784618731;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nhkLV0gTH4BitTfM5YVgSjZiXIp7iQInfmkb6/Vsto=;
        b=qkQVSDC0Gd6UleLBsMDPcZb+AWtpIP3s4/FlaaXaut+BroI21fYYEYNl3VemaBDC+J
         9n7YbL6rsJWB3eHytmTNi83Hi/TYZO9TD4oH9h/XlLYNbystOf5fHTDeRrT+5LOO3wUi
         G7rEUkQiIeAefLztoDmIoMeDHhmfTUUfqDkNvLJlpzVyUsz5VzJCymzJ3L5zylqdUOdM
         gXNYuXmvhkN6J7/csVh7hv1JppSOI9neP+jovBMtLKlJXzTbZ0x6DYgp2m4sXykFg3W/
         9Q0MwZid+ou/vU+MtZ+V3pgnOcyx5Ou79+Gy0WUSj4PdWTIDxooXc5oE7XybyQ3NrOtw
         kQNQ==
X-Gm-Message-State: AOJu0YyKiGCuAlOKBu9zsq2oZF1grPMRJpW4YIkAivqbhkyliMRGje7n
	YHxtuchSEyXRkdRGf4qlZf76Epg9J80N4bXvD8uT/QErHQ0VOw5dhnM8WI1cEsLGhQg=
X-Gm-Gg: AfdE7clzc5SdBtEgqPaOhmQfxS1RG8TZ2mOyJ/sqknHrAdje38MvJ5l5NSci+eWWH/4
	R055bZ1DbfbIsEGN96uf/LLF06uCErh/mqt7YKDHebAgJIkgzg5bdONewjJMlrYYUBtHib3ie5u
	895xD7ru0TBGuLCbOLKHlvYhjb0hy09V6Qa5gSWe+d9qvU7RI8USz0zvQ/Ec8YdZyjT6iIvcdXK
	xfl6ZDx9HeWLODELRp1abvYei2CrrxJUfn1Sn8IQuLbVq2iBisNz9Sx0L6oiXRnawnMr+3glByv
	uV3FgQB7KTpBk7NQZ1HrvfBz2oLNe8EznuqTvhFLuwczOSE60W+AGomeI/9qIS1FXHZMnRMkneQ
	x0G2yZvYL5S3blKJhd/KWkoysys/PfEd4vAhF2GWPDdBt29PbbiIxAlSueYSnn+eKj1H9SdL+AK
	57BktJA3pDnVNf+s5tJEA/33SVuoZfglng775bRgv2nzcJwNUH0h/z3Rau7DifnqSu770+tIGb7
	0qYI4VT1rbX8sE=
X-Received: by 2002:a05:6000:24c9:b0:47e:81aa:3822 with SMTP id ffacd0b85a97d-47f2dcf3f27mr13621849f8f.42.1784013930681;
        Tue, 14 Jul 2026 00:25:30 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4634e036sm6959684f8f.5.2026.07.14.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/20] gpio: pl061: Use empty initializer for amba_id terminator
Date: Tue, 14 Jul 2026 09:24:11 +0200
Message-ID:  <3a6862e6ca811d7273b0ee27fb8cfd76ef70deb2.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=kujYGNt7XvMhEZd6iktrLMCpUgQvKZNVtEThnF4x/hw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQ04CGHLM+urxkjaSbLnCdmQj5HHhbqWaLIk gk3q1yhTk2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkNAAKCRCPgPtYfRL+ TgMOCACrH6sPXvFklXWqqQR/DCrHxuRxpy0aE7tvnKZH07JC0jQ4VpnCWVJRM7LQBgbiKKZPl0y DsHgdh5mI6sMQtJi2syZBF7ShCp9Zhv6la5KwOxBmwTp7zMh4puShvEpK5ol1Y08PBJ4LZcRVb9 WTMdBRUAfpH2nAw9qSJpFOW8G+di85Bp/p7RtlCF6X0IjVB+FdBw0gIf2feQWbdxFMURwt5N3St JiBEtn8Lmx77AI5BhnfQntzrN2cjCZ/NhkZZieHtBGm8RnljgmF+caZ/1nOHx76K7Z6+78WmD/6 APfdUiZp+Hb9NkSHirUciWfQ0tksKHmGSwsJJORIa/9N1UXO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40024-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FD1E751D9C

A device-id list terminator has to be completely zeroed. Most such
terminators (also for other device ids than amba_id) use an empty
initializer for that and let the compiler care for zeroing the entry.

While touching this entry, drop the trailing comma.

There are no changes to the compiled driver, only the source looks
nicer.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pl061.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..0f4c64f43ac4 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -413,7 +413,7 @@ static const struct amba_id pl061_ids[] = {
 		.id	= 0x00041061,
 		.mask	= 0x000fffff,
 	},
-	{ 0, 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(amba, pl061_ids);
 
-- 
2.55.0.11.g153666a7d9bb



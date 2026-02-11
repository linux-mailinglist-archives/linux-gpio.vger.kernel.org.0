Return-Path: <linux-gpio+bounces-31586-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMJzEWU6jGlZjgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31586-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:14:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E371221E4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 386FC3018F3F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2B1350D75;
	Wed, 11 Feb 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmC4tRNy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4909350D42
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770797658; cv=none; b=SQDm3brCUC4DGuR6knPHVLvSs2fN1NZ2pHxRZFpYEnSjRrEc7BgLnZm1v1exVaJjQdWRV24iPsfHJeA3NEpBu2bUjwMeguYCaO4Z7F9X3gUDLzht2RlopUVpX2d63udOOoAC3SP8Qowfq/aobxcwrGANflhcBChp57ykeYqlmi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770797658; c=relaxed/simple;
	bh=tqXXY5duIcwljLAHXHGNBSSfoC8NsDselCm3mncAnsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKJPjO+PBmXXh03UAXrQSNJ9mQCZ7itqqcBqUw7Sd6h27Z2kpKu5tV2/UoeBeS8aT6ptESq81f+xrOUuFPc76otyxRbpTG0e6FZFhiOK4l3+j/77nIVg3GgelvYyRjkw9PMHElB94n47fudaNxfJlTwVPMuexitXodLCtMa+rBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmC4tRNy; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45f015a3259so1849225b6e.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 00:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770797656; x=1771402456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pguu8MUXddF1NDD8QGGi3BFiPLSK8t0wKet5P/7CmbE=;
        b=HmC4tRNyQy5GQjXKdLipBqaddW1zNLnO7aqqrVt+qwtUlTvNQPrbK+6Sla4a4U3nMi
         6ZMlF5XElj1F5+alc9Ma0lH1mpMZSoOy+RSJ7XN7smUHVlyuRnmAHFzpc2MmbcM4NTmL
         qi6YdBkoOrnd8etaJLur1Onj5ChbsLaF/TwjcOTO80Lq8iTYWxxDkX1jaOO12MdPgRx1
         gGKy0T5FnHwkD1PRGlxbNc/dE90brSDr/mVMc/Zz3ps5wy0hQGjrwFacZ9Jv3wC0Cy1M
         7MZ9MxV+d0PBBCoBT/dt9xKvIsXJlFKoCrcXkdSXCBFwAfHMUQB5QLsgc5J6bWPeFc7E
         /Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770797656; x=1771402456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pguu8MUXddF1NDD8QGGi3BFiPLSK8t0wKet5P/7CmbE=;
        b=C8t63PuW0VDiLKOFcaxf6hSuH+e8sJRfGfliTyEEblbFODGHMTg2pf0D2nC0XHBDtx
         yZ2+gQH8bKG0GsrPPbJXgJU9Z6gny59iQlXkl6QxgebQ3mrdLcTDNZbbdV/2A2nONNXn
         OwnIgdQBLnzKszI7tlSkY58NbzRcDrrt8iNHitjb1Y1z24SqbSZMVjRO1uY7CwzAfzqA
         4sOJ9tSSCdHtlTVcsrwCrF4xPToh8tTqwsM1hg0zpmMOGAkGje9N6cqRyyfnP/xowdqX
         8sjZrWK8NAGhi3XQLURHvGB0QIHoOyZNWXZk6PuhAPzaKNTj1jWG4gCZcf5WW2S6NJen
         +Kng==
X-Gm-Message-State: AOJu0YwAD/1XkUYBmYq7UGKWf8RW4pYhSiPjsNYoMQw2JvDLFsAXiNSK
	K6mKve3mBL/GHm1U68eQQztAsqN2JFCrli53fyWCBk90fT0bSDbE69G2lEq/Ew==
X-Gm-Gg: AZuq6aLcMaNHdaawvQ6zkXM3f2rADrV1CkHzRkbI1MjpkGVpfnLVWGyVEId/GSkM9zr
	LW1tcxZNRhpeh++XxjebRgbnv5eD0AXq3Ey6wXmBjbUsVbP72jt2DdCOPSb6SoIsuolgS+8fAG2
	X4xcA8P7XKNipQ6tWwqem1vTxXpcfkZ2ZHgs4uP01w6oJw0HCBMrSyk0TtiyP2SAbb5/+nkb+Cr
	ti77vYls4LgXauZcZ8lJT7AGDXNuB4HRuxwQqkFeKzEF/FEmbsFW0VZIzemCD5oxMMRIOsuBWm9
	R54Xz7guyEEUDaRlWy4DCOnPd62dB2BycuecO5xRtIU80dv7ScJNr8bY/Tk0+wedODLHb0MsNlc
	3H4FB6ALgzsLnmu46ekSxRZ+guXC69h6/VmoiSU//Pc55f00wEakqdBDu/+ZrXN7693EzHdy9R3
	6yipjRVFy/efMhZuwj8KTHkixOYGxluqy4i8G/LYF9f+Wyq2Q0hgiXcNgp35E+k15ZDaml1kYEM
	0cybypHgDL0uSTg6U5stiGip9fC1icq5uPUK+ynyZ5Lg5GWwzH7L9kBhXYFSTRalQSl4udgbQ==
X-Received: by 2002:a05:6808:150f:b0:44d:a817:2d72 with SMTP id 5614622812f47-46366633c0cmr910471b6e.60.1770797656445;
        Wed, 11 Feb 2026 00:14:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net. [71.218.105.26])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4636b093ee1sm624852b6e.14.2026.02.11.00.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:14:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <linux@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT compatible
Date: Wed, 11 Feb 2026 01:13:50 -0700
Message-ID: <20260211081355.3028947-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211081355.3028947-1-james.hilliard1@gmail.com>
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31586-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,kernel.org,ew.tq-group.com,vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5E371221E4
X-Rspamd-Action: no action

Add an OF match entry for "gpio-aggregator" to support plain GPIO
forwarding from devicetree without delay semantics.

This allows exposing selected lines as a logical GPIO controller with
stable aggregated offsets, so consumers can reference forwarded lines
instead of physical controller offsets. It also allows creating bundled
groups of named lines that can be exposed to userspace as a convenient
virtual gpiochip interface. Using "gpio-delay" for this case is not
suitable because it enables delay features and requires 3-cell GPIO
specifiers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Split DT schema into a separate patch
    (suggested by Krzysztof Kozlowski)
  - Expand commit message rationale and use-case explanation
    (suggested by Krzysztof Kozlowski)
  - Clarify userspace use case with bundled named line groups
---
 drivers/gpio/gpio-aggregator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 416f265d09d0..a09752fc5fe2 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1635,6 +1635,9 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id gpio_aggregator_dt_ids[] = {
+	{
+		.compatible = "gpio-aggregator",
+	},
 	{
 		.compatible = "gpio-delay",
 		.data = (void *)FWD_FEATURE_DELAY,
-- 
2.43.0



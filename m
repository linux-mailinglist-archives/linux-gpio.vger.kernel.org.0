Return-Path: <linux-gpio+bounces-32004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAG7OYGSm2mj2QMAu9opvQ
	(envelope-from <linux-gpio+bounces-32004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:34:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D9170CB1
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5163301D4E8
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 23:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0DB35CBCB;
	Sun, 22 Feb 2026 23:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cox+aOen";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/pdifa5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C008835CBB7
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 23:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771803237; cv=none; b=SUYY3+tZoyU31AM8Ot+EvP4AeoWot/515T054Vwn2Ec5IF+1lFsmDQp4fkLTEgWbRzH0NaqafjAKKK+iekjQhoFaDKSSJvNP+L36VeVpivQuCQaI46GbrsxgMInrTaGQEOTOUsOXtA/jRV8awynsU1DS66bRr5ImKt4Y4nhnUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771803237; c=relaxed/simple;
	bh=2Kwf5rJpfVsfKL7rPp19Hq0uGR5OMqBBvhUTH539Qww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZezHomlqiSLiFgW+mlDjZ3c3vixnPVtFNNFr2bkK0TaeTw4/W+S7b/DCU3bag0aEiL1WLl2+sO5OiwcRQsoWzrGw8A/wx+BI8MMxB/O/2H0TTEVH4o/kjU5UA3rkA4ECNTIavvBF7jqistqAYG4e0a5Utdbec8bHcHFpRX9U+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cox+aOen; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/pdifa5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771803236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvstKzhCzy7UoXy5kts2Pcy93LZYc+6GQjgUn3qqSmE=;
	b=Cox+aOen0OO+7ChwIOmygiS1u8wBzqmr/3lPXivauigsbCkmF5M7jQtAIKnqcdrB5L4V3D
	AzheOWVZJzjkCTH34/y6V8uCkVGJ1tTDxjHi/6Dqvave5f0usBa0yiZYevYrPSZ3r/QksV
	CEl3QS5/C0Ha1xEehONhEX1S7/smnRc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-FWwHlEP7OLGSZ_AmLrnF4A-1; Sun, 22 Feb 2026 18:33:54 -0500
X-MC-Unique: FWwHlEP7OLGSZ_AmLrnF4A-1
X-Mimecast-MFC-AGG-ID: FWwHlEP7OLGSZ_AmLrnF4A_1771803234
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506a9bf9b3aso44774281cf.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 15:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771803234; x=1772408034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvstKzhCzy7UoXy5kts2Pcy93LZYc+6GQjgUn3qqSmE=;
        b=i/pdifa5nsLe/fKoqri8nODCGwMb7WvYouIWfybjj3u8n17412hfczu/YvwXh1W22O
         2gCZH3J7vnFCe2b+4AAvahHrZ7/0zMSpEs+4BK44Vzh6rXTrz2N4T8NqiqhsUTTYO8Xp
         OYUy8iCiiN9AKV86a5hT0YxpV4D0qLNoNH30fKCbMO45IPpcIlOlMwvmvP9Um9Ubjb86
         7pg1FwkYIa9RhEGLcwuw5ddt4RwTrek2CxSGJG40FLdLKX6tcuoyK3r2C+VJ5ye/39m8
         cbXMl5/zT0Sa8Tx6bnw1iRaDowV14MQsX5TaoWkfDdOE7YgB3J1kzx572icujhU6VuEz
         w3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771803234; x=1772408034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gvstKzhCzy7UoXy5kts2Pcy93LZYc+6GQjgUn3qqSmE=;
        b=ceVfaniabbITxyxWzk1v3ZuxM1eSqVBK9juZqlsdCypPrzk2n4qQQfOGdEv5J1c2PX
         lFIWiW7Ep8jOVIwGi5BQa54QlfXpONDX/fGTK2ccXqLGqf5EtFmg/DGMSfhEAtWHdIHW
         mfS3Hm37uRqOuwo3xiyohVAODDjx0WedGyDq5Y7uDq1hV2EoUKD7w0iydS90i6Gxm5RN
         SCrk5CcBuEipTB3q7daFyUbIt/i2xx/B1gBxm0P6S8mswe1LoJMSi2p73DIyKFiwpDAt
         Z+3wNoaGpM4nzUedFnv36QI6qtLjO3BXKN4q/H/9kChFaoxDl5je4ozcdS3xY8NQ22b4
         8qXA==
X-Gm-Message-State: AOJu0YwD4JELrwyXmtnlBoh0m7vCeUHHa07DeIi9ug1c2ZH7vuA12Vuj
	qx6ejKrOmt6k8DWaVOd4sLckaILKwZfCW3oRqpPimMyqJ3ps1AwlIGwILBJeaSahiEuEKZHDrPW
	4XXD/y1mNXIUca8+Q4LWKC7/Ma4lFDjAf7JcLvjm/y53aS+8mj6Ap55OvLIWSVzA=
X-Gm-Gg: AZuq6aKWgDazJwZTbzeTibavA2E/IX7czeZEDhRHcndRoHiyciQCuyerytRDgcGTwDX
	DxFeYsDqQ5AEfs033eUQwDdBepkmN8SvNGmnaU/AgavY0duToSLKWBaaZm9kI5rxqjOXp5+hFFs
	5Rf+MdHdxXmzCHL210W+759+4hoWgC5HG7ox1gVLNLfGKHscjcwps4YsmoYjv1erHJhaHg0eu8i
	ofH3xwjI87SxB79F0XbkyLeAzXhklAvkMqcU1BTwolNOxVPcBVQkvgHja/aKkYGYvvjQ//R1qHv
	nj3V2xZguH5mMFDYl9PaUpUGhlZ1jxV1wxjqgQyr+y8uKOXRUWPH//GTgznNx1nGR41pPfLBGdq
	iPqb4hD2cWUd6wuvrmZ62Vbvjg0QmW2+FsWVYFWm8GwZGfWaJingZsyfBWGrZgw==
X-Received: by 2002:a05:622a:9:b0:4f1:ac12:b01c with SMTP id d75a77b69052e-5070bba05f1mr106658111cf.3.1771803233882;
        Sun, 22 Feb 2026 15:33:53 -0800 (PST)
X-Received: by 2002:a05:622a:9:b0:4f1:ac12:b01c with SMTP id d75a77b69052e-5070bba05f1mr106657891cf.3.1771803233510;
        Sun, 22 Feb 2026 15:33:53 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6a2759sm53231931cf.17.2026.02.22.15.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:33:52 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:33:30 -0500
Subject: [PATCH 2/3] pinctrl: pic32: use consistent spacing around '+'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-pinctrl-pic32-v1-2-db86248da18d@redhat.com>
References: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
In-Reply-To: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2Kwf5rJpfVsfKL7rPp19Hq0uGR5OMqBBvhUTH539Qww=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnTwrfK165eF+G1uNbO0s7Kh2D1YzSO1YcVaxr75hnH
 VZi9FKgo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlEqDAyrJicIVSXLCatnxgU
 qpxw92nrsnn7m+++Frp7sp/jY3jNJUaGJ6mHuf71a3r/+FisLG0ZpHJCS6+l2Nqd4ef2lxUx+Qv
 YAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32004-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 591D9170CB1
X-Rspamd-Action: no action

Address the following warning from checkpatch.pl:

    ERROR: need consistent spacing around '+' (ctx:WxV)

Fixes: 2ba384e6c3810 ("pinctrl: pinctrl-pic32: Add PIC32 pin control driver")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pinctrl/pinctrl-pic32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index e97727a799d5f8a7f2ea76886af5174c863d8ae6..eb438c9d96673a7708d5681d2072bac30fcba010 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -1938,7 +1938,7 @@ static int pic32_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_UP:
 			dev_dbg(pctl->dev, "   pullup\n");
-			writel(mask, bank->reg_base +PIC32_SET(CNPU_REG));
+			writel(mask, bank->reg_base + PIC32_SET(CNPU_REG));
 			break;
 		case PIN_CONFIG_BIAS_PULL_DOWN:
 			dev_dbg(pctl->dev, "   pulldown\n");

-- 
2.53.0



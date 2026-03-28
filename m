Return-Path: <linux-gpio+bounces-34343-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WfaeI/iZx2nsZgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34343-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 10:06:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAEB34DE24
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 10:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A1EC302D52A
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 09:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60A5313272;
	Sat, 28 Mar 2026 09:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqPmzdDo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3147B2D594F
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774688755; cv=none; b=iH8mm2vsy5tvebKS/fS7BEEuqqdCVXjDFsUmw35N7uO6P9xBeP39QZpQv7KeOkMyMQRKSNV288XbnnIgQuzn72wPDtsXYUj7Y7nJEu9YuA/w/NLOURRcoi53hfPIh7GHAbbi1xXnxN6mhC+IrxlKt7gU3EIua0PFLQfjy6xP2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774688755; c=relaxed/simple;
	bh=MdQfG1i63z2+B8h+hGMucXuxr1uS0joRSYii9egx/pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Oq0WjU7hfAaeDrHOl31LZQfRvs/HZ9znXkDq7x5WxNmd3vADBhXlrAA4P5gcCLtqSYGdaeC1RnY5L+8B/+CAWStCtEfmwP9562h5TB3UB7otUN0rxvZMsitNZq+lc0eep0Q71x6M5yBXqY33D3JdrCHeQuuUb72jhlJ+SpcoCmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqPmzdDo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48538c5956bso28261355e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774688752; x=1775293552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrtALhRQ+/dB+7gUCD8Q9TtNE8HoAMbogKYxXP9zCuc=;
        b=YqPmzdDoWVyGbzubSdUmNkPvOMkfpJvQL+ELeDRnMBM3wZcYkJhLsb67NVCv2gKb0E
         v6tMqr43iMvBOZeyuAEB+yf5sHK84JV6daMkv4LQ9igsqE7pNS6abQre8XortyEKQa3Z
         SXMZcDCtPelvJCXEy4STLdd5QJqlsF+bUYkqkNqWEfgnvvXLKyYXG9DZE1VqfZ0sgB6Z
         XPGmYpsZAerd8eaqrduDyrUNzI74TO93ppaFWToAuPYFFS3F1NTiQBJvaB4HlCLzYOHp
         vB+ARVVzU3h8+RSUV6TZnzSbxxf3643uamvhRw36ppH5L7/ctVFCdtEaYEqGtUle0wlH
         fZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774688752; x=1775293552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrtALhRQ+/dB+7gUCD8Q9TtNE8HoAMbogKYxXP9zCuc=;
        b=A/1Mt8Qag2QWiAsP19fxVab//pC54tZbG7SRPrsqzvr5dW8yyaztPll4EN3beJBFHQ
         PRmeUf36NgvYipKj/fmNU9BN6zIJQ60OniREEJ9DRHCwdkTYQXTeJzY09oXpfV0yVpzO
         Lx+xXgb6diny+tT7lZEgUOW1YXl0y1hBSdwsBTrCYyOHKyrC3E0npWUZApWsmCU8UrT1
         5vA57y7+zbbVBMKERQDpjNDt46O+bZHbpNJRv2WetjyGE+CXVRwJ0rcpExIA3yc57Dm7
         hE4C5M5juszhHq5VRukm1QpNzKJcgmyr+LrVxDj9mNsNe4GMVwEhmvp24k/CPJd9jOVy
         vgMA==
X-Forwarded-Encrypted: i=1; AJvYcCWaiATURZYvvVPlhH2qaEfK+I/hBMyKpmxk189SeW/BnVT0LgdfZYsYuljFfPylgMekIZX3jkqy8XLO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+e/c7RVfavxVjRt+4P4IN/R6QNV5RtmM25Oey97wZoJR6HNOW
	B83ZwQwW0T/oYrcqOHqoIObuIRjLMT4rm2CvCqXrkBXky+G98XLMLEKX
X-Gm-Gg: ATEYQzzOTMnRxI0dPf9LY//7WFW4k1ycPOBKyndv114g75PmAxAYPmETZebuvUpTDxi
	82zcJ1ZknIOo3xo+10gWXKyEfflAo4FNwilY0WFBudlyFMTtrEHyKAsExU7VMSiCSQ7gIkeJYM0
	h0knzzRca5QrGfY6dv/ywUdaE9jH1NN2Du+zDSo1CoZanXFwPUUjsCL6cjIN034SQF+UkgmZ98H
	a9xL6WxkTOpNqX9fhaRxJme2KyTS07l7DnMcq6DtWfhMixGmX29+TIL2shAdYkXPLqtKIRdV+pt
	ufufZ+qx0N/66VTAM/pcEOKWhSfcvXrGojV2VFkBac6uz+LfRHAN1B8FEADuZYhgBy2c3JSAG6v
	n3NUPrNFtUA3VtjIwgjin7W7o2c7OzYJWcsBMjHZshcFfNsdMIBsKRmb4bYkWYZ8P3L/5ek1Pik
	32ELkDPzEIQzDQZ/0Jo30ui1Uv8rWQeEyAVdelvUP254GH+/8/
X-Received: by 2002:a05:600c:6986:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48729109c35mr75510485e9.11.1774688752254;
        Sat, 28 Mar 2026 02:05:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8a55:5310:98fe:930d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727bfc5ecsm77227735e9.1.2026.03.28.02.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:05:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix incorrect PUPD register offset for high pins during suspend/resume
Date: Sat, 28 Mar 2026 09:05:45 +0000
Message-ID: <20260328090548.84124-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34343-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: CFAEB34DE24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

When saving/restoring pull-up/down register state during suspend/resume,
the second PUPD register access was incorrectly using the same base offset
as the first, effectively reading/writing the same register twice instead
of the adjacent one.

Add the correct + 4 byte offset to the second RZG2L_PCTRL_REG_ACCESS32
call so that pupd[1][port] is properly saved and restored from the next
32-bit register in the PUPD register pair, covering pins 4–7 of ports
with 4 or more pins.

Fixes: b2bd65fbb617 ("pinctrl: renesas: rzg2l: Add suspend/resume support for pull up/down")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 561e6018fd89..68b94c748f53 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3049,7 +3049,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
 						 cache->pupd[0][port]);
 			if (pincnt >= 4) {
-				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
+				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off) + 4,
 							 cache->pupd[1][port]);
 			}
 		}
-- 
2.43.0



Return-Path: <linux-gpio+bounces-37599-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK1LIm9dF2qpCggAu9opvQ
	(envelope-from <linux-gpio+bounces-37599-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 23:09:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 050AF5EA54F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 23:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D4A73054F50
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 21:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166143B4E9A;
	Wed, 27 May 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="za1OI7nA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B0B363C40
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779916140; cv=none; b=TsPRZaKfbt+fHlsAKATsGWbqPjD/a7+WoWhQgHFKeTEklhrZO1kOEquMDBMaBMxK72tP3WK9wGwrXB8vXRRq81NAF9hHjc0PyTj306YYI169QlNDaBDMifpjwkrM34jK47c4awRySzgiB45BEbFOmdd4lQMQcCv+ma9YdJ0R5SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779916140; c=relaxed/simple;
	bh=j6wFuV9ThpOiYYv2+F20SQy9uhrC4cWysfOvCPDsdn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u3MTa9HCGdEWopbT15bku3/OEdLbPWYgUvNvbadcCUY12flxvDJFJfuiRfYvUd0Wt76PQ/m5TeDjszswIFNvSY/O565Cy0nR853iT/bSnv6gXts9d6Kc5uzplh41RuCWnXj5OkphQcM/Nn0bppnoqtLvwSHEYy4yBGdtxfarOWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=za1OI7nA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891b0786beso80878225e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779916137; x=1780520937; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwGOVfYvO201sEUuE8/pQvxXnipLjm8iFFFY82DZt50=;
        b=za1OI7nApO8qrcrKVgaNRYA/rhCmhytxvsFuK+utVti8NLC4g2ubtvU50zCxNYM6z4
         es2/eY4PZe7WLkMFE2dOJ4jzjYn3OJAmrkAncz6/fvV/JAviIp6gDVwYYmN9UyomSACY
         C3t4/5S1k3XTBT3EPgLV65wEsg40w1sA03FS1X8zUTUw7HmArEJsLqpiIaK+6/FOgaJW
         aw+Ic7L3vyTBe//3l+wmhnONm0WjWW6L7KRZP3TXHdpfK3bszKxtQX9oJNgtlSanHqSg
         YDUpiD6UZWe2T++utpu/nqTeYN8xSA8HeGF8+XcxvMoVJwrBol+9C4gzx4R2uGiHmDtQ
         1Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779916137; x=1780520937;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwGOVfYvO201sEUuE8/pQvxXnipLjm8iFFFY82DZt50=;
        b=Q3XIeouck6aU5Kkrv6vQPhFZQQeH57DE4M0Boy5H3/MmY83nqJh6fl0TYP9HdwVZiN
         XqyySAKxxC9mHKYa7ncoFUG2wpyO9wHYokpNdqMQ+mTGBl6RrGU0jG3mcy9uO79b+LaF
         2H2ad2EC8PbeX4ZWvNtV0FPSo26/jE/gadBhOXyFHMyGa/laEc7gD8s0aWcNdwfaRh/t
         2N3KsMwyCic7UsH8P7PbWPR2WGGBuUCuhpIIHd5MALjEcbgVUiSePuVb5InjiwcvbN5O
         22FIApTX0QP6evow9Ez55s5/lkIxUzh/YAvb3uG752E+8YAIU9wWmqZwH0mmhPldvXcN
         m+nw==
X-Forwarded-Encrypted: i=1; AFNElJ9Oap31ivzZUhmtKR5O6Wr1NeGQfFq9KGpY+8oj7E+Vp6cumGsxWAlXsoEhUlqYiv+B3o9GqXOx9i89@vger.kernel.org
X-Gm-Message-State: AOJu0YxmzgafLG7/uC/w6Peb+hgk70b3wvSipjNHt0ZGx19OJdj8PrF9
	MJb2bcikpppjANGBGeV2/TYOzxZetxNti7oTe0K3zqj64yZUV1rnmVSJ8VeLmLr2PLw=
X-Gm-Gg: Acq92OGRzwxDXWDwnqgY2D3qJJJnYv2CDOeBdLpS8sRsVmdwA3PnH1odBCuj7/fdK6x
	l/gDFGtlI5lGg6sktGP2ZC+BVAnwyTbjJkclkwD4BuoTkgOBzQ0TwS819nJPi0s+qF1i0hPx7ze
	qHGvFOmZcE/3GjHSzyaTZt8Bfxx9j+kZFQpekfYj125V750OsTbcOwQ2sTWsICknWtrkOGrZcpd
	m3Lr2fdA838HgI7fmR0YkUYf7waWSptO/kgbsa3dTorhYGdqzWf1M60id5crl3Mxf6mOlumULmC
	jW+NG7kyEidPpvWjoPMePmRn/hUsoETxZ0j34uC71uhyj4Rm7bspMF9/+vNSR+FItoWC9RMBDp1
	PPHjGbScNplTZceDpTavBwFH3En9L2HPZ5RwPsLnyNObPW/PCEH+vpzmga+5kHQ+EbXMrdXKQNJ
	tFYF+v+fTXAVctb57JsWNQZQEmDjx/735TDhtV1cxiHsKPtrdaJboWB7W3kEjmQ8qF5DooL8Q4c
	bN79g==
X-Received: by 2002:a05:600c:4f53:b0:490:7136:ad05 with SMTP id 5b1f17b1804b1-4907136ae08mr166302985e9.31.1779916137581;
        Wed, 27 May 2026 14:08:57 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3124:1301:985d:3d5a:fde7:e337])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2a7esm8894393f8f.20.2026.05.27.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:08:57 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 27 May 2026 22:08:45 +0100
Subject: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF1dF2oC/x3MQQqDQAxA0atI1g3YOCr0KtLFqFEDGiWxRRDv7
 uDiL97mn+Bswg6f7ATjv7ismvB+ZdBNUUdG6ZOBcqrykmr0uPhPR9xEu91mXKLonmJDClwThRC
 GtoA02IwHOZ55872uG8KlVnBsAAAA
X-Change-ID: 20260527-samsung-pinctrl-maintainer-24e722444fb3
To: Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=j6wFuV9ThpOiYYv2+F20SQy9uhrC4cWysfOvCPDsdn8=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqF11oeZy9qBNJRm/bBBlN5oqdTNhD+u/OcJlpE
 7nz7tJGHqqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCahddaAAKCRDO6LjWAjRy
 uiezD/9RiQ+SU3hWpIFufpXvMquOn7fTgIPsWh1qTpvzmvn//E2LOCyUwHfpvOvpeTwe08c+H/H
 s3L8f/MrClZ7biqYXvxf8uWRfjL8Nc7ww8pcGc82wc4e2pSXumJsjiZl4hFcFaLxVVTB94Kovko
 GRqVBSSb+UtAA8dFfw47sguk9M5t90T7F/ixhn1mkAIXBy2RnQVV2QEXOu6wwkgzOp6faciW61J
 N9ATjWPukTOci3t0IdgF/tN2p44ilGsBTyqgJTqRXJ2wXZ+huHT6VNLj0YFYL3wdAXThAsO1e07
 iC/aVY6FtSJ7GGV3GkL5hPu7dhdx2pL6Jej7xOwhyFHEgrfH7Gq3Ye56XHyNkGkKPbkGlM2yTjN
 lP1bGjKwgDUbtwpxJu/awzKYN4lQWXcFuxZ9TScje0CAZECK2AamqT7M5RWCRfhJLMoT4Y6UMYg
 mdRmns+ysMHYcHG95Qw7q6VJh0s0/H0cRJVYJjakrU51S1zPVez5f+iyed4Gr4GwtNbGsjG4vZi
 b2IJfG+w+ABeakd9GrFWdNSx/raKFbLg+KdrvumftVEwpuG/DlVcUEmzZwQRH+nBaZt7n0XLtZz
 sabWY12UGFj49Bsk7+nfI4S9g2NHieiSeJkgntWWiFp/6Bgy6uVjRLALxLP/Qo1ujL+/Ms2PrQX
 g5yRRYdlL4yBTFQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37599-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,infradead.org:email]
X-Rspamd-Queue-Id: 050AF5EA54F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As Google Tensor gs101 is based off a Samsung Exynos design I've been
working on the Samsung pinctrl drivers and have an interest in helping
maintain this code.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This follows discussions with Krzysztof about expanding the Samsung SoC
maintenance team in the kernel.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..69ad1913a9f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21298,6 +21298,7 @@ F:	drivers/pinctrl/renesas/
 PIN CONTROLLER - SAMSUNG
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Peter Griffin <peter.griffin@linaro.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org

---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-samsung-pinctrl-maintainer-24e722444fb3

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>



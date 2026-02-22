Return-Path: <linux-gpio+bounces-32005-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMfCIHiSm2mj2QMAu9opvQ
	(envelope-from <linux-gpio+bounces-32005-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:34:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22A170CA2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E495C30117CA
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 23:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F5E35CBD4;
	Sun, 22 Feb 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OuAaO/m9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AWPedgxR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAF835D5F1
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 23:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771803240; cv=none; b=NPvlbmdILBHtyeLtIrqtjEymwuFAI1zevBm+H6S0r0L51h2jVHniMHHoOchikOcPplgqqzbqANVMmKy7ko/Mgyi4KXWyWM64g1Gcg8cC++mwcYqsCF1RhE3WAJl23h2d06xfm6lI80LAqS/vDQMUhNZLmOGFly5yECM5NThRZpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771803240; c=relaxed/simple;
	bh=svCv8EWUer1B9zIMRbpKrjQcErc+c2NHMAfk2pXT6MQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIs6Xz3cTTToWe0ZAuz65zAIni3ek9Pj+jfe/nIpqaIW5SJIF9mMMXuCkqGoiOhYYHlRtWucWcnk4VksWR6etAdtX3qmzsyRxdbI7DNfF3Nx57D+oanabN09XsxSZFDjN3PZfaQo5oKSeb76a/NiaEHXmFJx/IFAE/VZDN7UZdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OuAaO/m9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AWPedgxR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771803238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gurxdqgj9Ar4e6g5CjpcwY9sy4G+S/QFG+5Os7rxaak=;
	b=OuAaO/m9h2OaKXiUJyhTvGOGEYZt5BOgCyZ637ak4+/UDbPXBQinkkI9k/uKCXmiiw6RBk
	eZN6aywQPpD4IKrPQBv3YHf2vN8cs8dGD+Rz3d3I4cxsijDLyZa+Z17Gnrd2AODrwZVOyH
	oMTJsBMqdBH+iNKJiB5gKBa0OhrDM/U=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-dcp1s6a6NaGkGvhU2Jqd0A-1; Sun, 22 Feb 2026 18:33:56 -0500
X-MC-Unique: dcp1s6a6NaGkGvhU2Jqd0A-1
X-Mimecast-MFC-AGG-ID: dcp1s6a6NaGkGvhU2Jqd0A_1771803236
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506b839cafaso56489091cf.3
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 15:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771803236; x=1772408036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gurxdqgj9Ar4e6g5CjpcwY9sy4G+S/QFG+5Os7rxaak=;
        b=AWPedgxRUeZAe/0i/xgh9TY1YrVmTe3/MQ6HeJLPhn781LfPHNa0L7PetJWPeg/PS9
         Kkv0FKjwBBwQdK4PnunlBairlCvdFTCMOWwHE5qLBzLXkq10OMHg1VBSHFyUQb6LE0gC
         l69f2AbfpQC2NYc3WeCePaC4Eh7XB6T7MUNxJWYO+eMq4cIRYKL6GSPKPufb/jCidJe8
         W79om+IFOdR5n1OMgQqVD2Q32oj/jiFgd2dsLYnqLUa6D5KvRo3jIxxKF+vtJ/Sey/1x
         nNEp1F1x2HJLrr/0xQHpiZxY7QO7Z4KKN1JqyonpKAy84nHAHt+TeWiY7QIE94xdG2xo
         HhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771803236; x=1772408036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gurxdqgj9Ar4e6g5CjpcwY9sy4G+S/QFG+5Os7rxaak=;
        b=I+6voevJybkaKVRhwp7tWCYKuu2DVhwpu3HJH3UrFY8+FIadH0sBIEYDVqnRmi5xj4
         AidcKO0/1j+te4NBAM983j4kWRrLcbVrHDLvQQzoBUAPW3nZDe2D8qH1zn8LkhgR160Q
         dulut+oj3lcdcmdpmHYw1VuSwQaUobB319nzfy1jRuw7w/QNAVuC9i4MfZWlYTzt3xvc
         ttXJkzHfNaLPHPpacrtvaUTbLB/izl7EbUF/E5ttfWSEEinrZhh8TUGoLdBvsFQt5gSM
         1Zw39LN8vVIWn5Raq6K8bQ0b3mdtgCkRocS+fSJlSXtO8usWYto+g0tIuLPNmsHq+dNQ
         Y3Og==
X-Gm-Message-State: AOJu0YxLli9Gx9VNUgkZuz05R9w7cGqUm7pd9fTWpdA3aYnLfQVwJinD
	Bi++FrvTRkY/CdsuMGqeYg48QMc7b8ZoH5VUXIKCbuGGVpLKUqw/GYWLSASgrhJjVV6P7w/g6ga
	Xlh9VGyhciosFA570vB5b9IB4IiBq/+f3+bpvNScPDddLlm7HJ73x9NoG+DWChWlWkx5aA2g=
X-Gm-Gg: AZuq6aIkG07zqy59O9xENS2BpM+uIqyYnG5Aj1dBuOSjYiLGv1cy3s0IKK+EbgXmOmZ
	THOfxkQJeYZB7lT9NDjWXItOB+s4ZYV7houbNSbPcquIF6qhbXeIwIg1CWJ/lpOvpoeAQ8QU8ru
	Gmweig/W+vgQDRMzexyKDMmBcBDJhfpDSHJ1f8cnWfXAqS184DAVllGnW1OYin4JHhGD1zLhk6v
	iNXPtywHATQgajWyjS6bpBE0IuAv6kfHgTHwR9dC0lxKb0/JkOd0BO15mP0LSh8C+WQl7zWrR0h
	m0NfzZ0kqh7RnDPPRPrqkLDgVnO1zhK59ShiswrN8rP8hKp4ppo04F6uwK3gqQ5tKAyJVZGMe3/
	0I6j6JHgmJZf7Lbe6MGW8cAB5XYHHMS0cPZwNa0+CHuRWU/4xwOVdmJqkVr6RYg==
X-Received: by 2002:a05:622a:15cb:b0:4ee:3ece:a652 with SMTP id d75a77b69052e-5070bc66bb1mr95930961cf.42.1771803236004;
        Sun, 22 Feb 2026 15:33:56 -0800 (PST)
X-Received: by 2002:a05:622a:15cb:b0:4ee:3ece:a652 with SMTP id d75a77b69052e-5070bc66bb1mr95930871cf.42.1771803235649;
        Sun, 22 Feb 2026 15:33:55 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6a2759sm53231931cf.17.2026.02.22.15.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:33:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:33:31 -0500
Subject: [PATCH 3/3] pinctrl: pic32: allow driver to be compiled with
 COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-pinctrl-pic32-v1-3-db86248da18d@redhat.com>
References: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
In-Reply-To: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=svCv8EWUer1B9zIMRbpKrjQcErc+c2NHMAfk2pXT6MQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnT4q4z67m/1P84gfXy7Nmz9m8f4eG+vxStaZpNVOy4
 gQKXcVOdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRpmWMDGeLWA53JwZN6L5w
 l2ei/tRCx1t8uZZSP/9Lhfy2FeAR4WFkaDswU3aimNkFqVUv6/4sEHb8+0T5StDV3dXcWrMeWp/
 wZgQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32005-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B22A170CA2
X-Rspamd-Action: no action

This driver currently only supports builds against a PIC32 target. Now
that commit b8694faa1a0f ("pinctrl: pic32: update include to use pic32.h
from platform_data") is merged, it's possible to compile this driver on
other architectures.

To avoid future breakage of this driver in the future, let's update the
Kconfig so that it can be built with COMPILE_TEST enabled on all
architectures.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f5354f5b92223f8cd80d2f7a08f8e7d..1965d4fb461d93cb486e80864cee61fc5acc9ab4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -478,7 +478,7 @@ config PINCTRL_PEF2256
 config PINCTRL_PIC32
 	bool "Microchip PIC32 pin controller driver"
 	depends on OF
-	depends on MACH_PIC32
+	depends on MACH_PIC32 || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP

-- 
2.53.0



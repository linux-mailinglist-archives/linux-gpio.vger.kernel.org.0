Return-Path: <linux-gpio+bounces-29877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1BCDC3F0
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 13:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31FE5305D9A5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 12:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE8E313E29;
	Wed, 24 Dec 2025 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="lZsLg4ZJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246EF2E11B0;
	Wed, 24 Dec 2025 12:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579928; cv=pass; b=guwXAqn6jHzjxprNeL3ED9KaY98DdvA5YLVTWa1Gc4xVTKXRDWLf0xzSYDVz/odAmgbInsb7cz4pYHYufF4iarwH30zUM4VQcmv+HjFNz3upyTYM6qyhpsrcNs6TwldxxnZEUY28iUZHlZo63X0AWS6Mz0b0xXqRyxQJvvU1uKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579928; c=relaxed/simple;
	bh=b+q5DFY2FRFpj99Z8c2e5Ja3GGR7qBKmhN5yn8gmq/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9eAzGzKXSZSCR7uLaiHjWzfpOVdMOGjm63+8WabcyFgkRGpk6m8rky+TcySBJ6ssfJtDhuABAWSARwP7SESJgS1wj92tIudNSpwoG7dpVEmRI8GQEu8T2yC3cR0MjJdsC6nDy0hYOOowz0Kz9thlqMbyCWLUUiI+5IzKkWPNCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=lZsLg4ZJ; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5BOCbwNT059760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 24 Dec 2025 21:38:02 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 28A07109D6C01;
	Wed, 24 Dec 2025 21:37:57 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlDxsHDJbzc2; Wed, 24 Dec 2025 21:37:50 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 979B8109D6CBD; Wed, 24 Dec 2025 21:37:50 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1766579870;
	cv=none; b=VZ2FqrE3xvkJHlsPENKbYiXOFpiTGyx4QLc8zTRRJiZU3PGHMwaq+ulsRn+LUGfT3i6ev3aV2qX7ygMM7cj9VOkezata2jmxObtIAt3QC+wbh36/MqIrTr9slybrNyWHAu4B/ze4+eP+hiXJ42Mqr7yy5zOfj3eRXS1z1tK/mS8=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1766579870; c=relaxed/relaxed;
	bh=JaJFhAMxeYcUhDj+BkXxIIURTBgE7571e2zutaU/kGk=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=XnD5Dh8bxuTDZPyLSMzqn0d1HrOFYoaikRfU5mCafsmnjEdmosIWG54tmKHOmhIIwUJ3CY9CNIqzgo9KHtHH1BG9CYT0hxodeLAUKIIQmmhcGiSFAbeoHPXfC8rYGqMC6wqMcprtQZS8ZANTF5zNdz9nMpddXyPX/LHLnMH3lqw=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 979B8109D6CBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1766579870;
	bh=JaJFhAMxeYcUhDj+BkXxIIURTBgE7571e2zutaU/kGk=;
	h=From:To:Cc:Subject:Date:From;
	b=lZsLg4ZJonX3jV0fbIU2qrV2SOiYbBbEzRQG0hYeOZvfFTGjIRw4qSErlIi9QOJw2
	 62iGtKtGUFYCW/iYoiezSL/+4TjXdLBj2uTWDCunkbJIFziJwPWx8+6f5F6QYY1e12
	 XLv5ef9j7PCKuwsj0VBg9mo6rV+k0lvT9fuywVMA=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sowjanya D <lakshmi.sowjanya.d@intel.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] dt-bindings: pinctrl: intel: keembay: fix typo
Date: Wed, 24 Dec 2025 21:37:48 +0900
Message-ID: <20251224123748.2875868-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix a typo in the documentation ("upto" -> "up to").

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keemba=
y.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.ya=
ml
index 005d95a9e4d6..ec9848192351 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
@@ -33,7 +33,7 @@ properties:
   interrupts:
     description:
       Specifies the interrupt lines to be used by the controller.
-      Each interrupt line is shared by upto 4 GPIO lines.
+      Each interrupt line is shared by up to 4 GPIO lines.
     maxItems: 8
=20
   interrupt-controller: true
--=20
2.47.3



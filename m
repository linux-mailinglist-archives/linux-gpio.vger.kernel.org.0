Return-Path: <linux-gpio+bounces-10403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F23C9848C9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 17:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE741B2129C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 15:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A9B1AB503;
	Tue, 24 Sep 2024 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FF6Vz2Pz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002B927735;
	Tue, 24 Sep 2024 15:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727192366; cv=none; b=EwhQyJksQOoEfQRxUKtFEwMom4L9pS6heUb0r1KlxGq9QaP8Ebtf6FX0+h0oBajMEPGEinNNYel5s1MQOPHuLwcwaYjIa5mqPkSfM2kS3RTIMGIGqOb/bqfraZveKdSjuWjt+jfPYoCWSEYY4lyFfTAfZZf5nZ9OEXBfTU7xSyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727192366; c=relaxed/simple;
	bh=uYOGtuS1GH0n1hKTHBjFXo28BM9xtKgYiatxl2C25fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uWchvVVUdde3ZNZbdS06M4RguEvP6ZWSHf4N3D4/+5RdZxhCisStpSm8y3v9ZA7x9//0ajdecEDdEqn3j0AIn3ZxoIqFYk/LAyt1VBPR0w9XL6v2ePKA6AlKu+H3dc6bBan4tsW3XJiRirGKcz1+rVdZ8immAhA/1k5OB8Rkw6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FF6Vz2Pz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F731C4CEC4;
	Tue, 24 Sep 2024 15:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727192365;
	bh=uYOGtuS1GH0n1hKTHBjFXo28BM9xtKgYiatxl2C25fg=;
	h=From:Date:Subject:To:Cc:From;
	b=FF6Vz2PznCg6tglOutn3gIE6VSWq/Elctny4fQsxWLehuu+uwMK9XOCzjlNPPAjmG
	 XgLMSwwP9ohCDs5SmLlNXBkKMHS5VGTwznA5cQDDJekBn4HBzxr9rEbF1edffX14eu
	 jk6JCEFmfkFtZAKoh+XA5E4MTlddXa7O4vxxgYr4DWnIykKS8V6NAAfexGbUCGr5Fs
	 YyMrnzoJR/5H6blxtvQ2WgsnncQHSzN0Biqa8u8mD9kMMqrXCht4tNlcZI0pdRj8TK
	 N9z1FuJBhaVXwjMTto/5lsLv+gZMJpw0b+hYWwdfztS6sMbDXnAA1e24xtMyCWJhOn
	 xQhB/mJADorhg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 24 Sep 2024 17:39:18 +0200
Subject: [PATCH] pinctrl: sx150x: Use maple tree register cache
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-pinctl-sx150x-maple-v1-1-17dcfefefd17@kernel.org>
X-B4-Tracking: v=1; b=H4sIACXd8mYC/x3MQQqAIBBA0avErBtQsciuEi3MphooE40QorsnL
 d/i/wcSRaYEffVApJsTn75A1hW4zfqVkOdiUEJpYZTGwN5dO6YsG5HxsGEnnDsnF91MplUGShk
 iLZz/6zC+7wcSx/eLZQAAAA==
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uYOGtuS1GH0n1hKTHBjFXo28BM9xtKgYiatxl2C25fg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm8t0rqtZFaXSNN0LZDtkBCH3BPzzlev3DXYZIQ
 vtrN0BPh6uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvLdKwAKCRAk1otyXVSH
 0JjLB/0VU5y6mBu4TYbcQXhvSykE+PiyQIptW3o2RECM5I+4DN5yltR24UUqCR0NxzSQUhuFqrb
 rtM9u5br9gEk/J0TI+4QmSEg3HRwKkYJb7ZFumjKP8y8OpWwzO3LUM4yMfHaFtN+W7Q0h/+8DM4
 CF3tkDzJjX7G9dvPSzljrTSIJ6ni7C8uPeGbtNKK5O/PBL99DpJuUw2KQp9yvA2zdTWFHfWihzp
 Dd4mmB4vosGenQs5gF0qGPFvrKpU9zMHhOXlKgVF0FmfeC+vgQcjYcK5IPCJffBwnp8q8k2Om28
 gWawMwIYiud9js0WPnJpJqpcxKiYT3s1/pobNG5KQHdo+y+C
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The sx150x driver uses a rbtree register cache with no obvious reason for
specifically preferring it. The maple tree register cache is based on a
more modern data structure and makes implementation decisions more suitable
for modern systems so let's switch the driver to use that. No functional
change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/pinctrl/pinctrl-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index fd0331a87cda..ab87de319ad8 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1105,7 +1105,7 @@ static const struct regmap_config sx150x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 32,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_read = sx150x_regmap_reg_read,
 	.reg_write = sx150x_regmap_reg_write,

---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240924-pinctl-sx150x-maple-d8c1f45b9629

Best regards,
-- 
Mark Brown <broonie@kernel.org>



Return-Path: <linux-gpio+bounces-4162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0D872FFE
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 08:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6FFDB20A60
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 07:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5425D5CDCE;
	Wed,  6 Mar 2024 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+MwHYEK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC835C60F
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709711669; cv=none; b=qos1ZPLPbmrOmZjBQ9aLn4P9QDsl0xaENnTK3hjuUAMEgpaoY7sgYdzWeJwlVmKrMA0z/KQYg+KMhXSCq+QtkrUXxuUxKVvhZWpLzZk9O5QmVCbIgH3tXcPJ6utPjgyUwa1zO+yJk8HpAhFkhB95Jtu15yN156c17FoGPVqJiO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709711669; c=relaxed/simple;
	bh=0wiRTVwMpATfOfJ72M+YthVFgGZDcMmaS7CMlxBL95E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i+mJ+MS0pRFqBpQZou9w9l2C02S8uS19O2aYtRgOjSgOf2fN68sQmADgZhR+RJMCJzKxr+3ZYoeI9Q3iVr6JsH79sCBSxV0toAYFbwPkFJa4Su9aGV/IGNKjqCSRp4xBIdquRHUy+sEaEG5L5ZQPRfKXGK0ewrYEoW/uWtOX3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L+MwHYEK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4499ef8b5aso514394366b.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 23:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709711666; x=1710316466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jnmhCaXqdBzSzRGuB9lkt+sZL4daDBjvU6v4e0QXBuA=;
        b=L+MwHYEK6wYQCmcrfbrLkgku7KARSm9BKek7rD7CYM1plSd/FS4Jntvws1zVqtrUh+
         8NI5qupispFH0izzFa+dNPWTXYiuRfad10gTrCyEHNK7D3pNHfobuMLVfXiF0VXftcsm
         iVLUwPdOLPgqtwb+e5EO3ICQ6Iiyqxirz38sFJQPeWQJgViXn6gLjUAED8Bl2mRcrwQt
         FQqaLUvw4AGlY8bF8WLMiY6RZuLNvymFVC4Ce57UQ39KPA0FXuz8IKVaLpzHxTKB+FH0
         m860yA+6yN0u+8Txe8z/horer8tapqEwaN7AtZ3Bz7wm9xWw1jzoorcGyb/39hoKsOvB
         8mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709711666; x=1710316466;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnmhCaXqdBzSzRGuB9lkt+sZL4daDBjvU6v4e0QXBuA=;
        b=NNwUO99ucui/+NWsyyWs6zNbLR/suEv0O+t13KbR9tmzhrx0LYyCT6C+olpoMt/4jw
         a0AlCE/Uc00i9Jc460cC5mylh7LJcY/+en8mQfkZYSZYmd7dQ1cOD5VVnZ+KDqyAYypf
         ZF+OnbwipCF+KFyBIZiApPGdY0wFDy+bb3fYCnfjquLhfB0GTtVlaXjFc0yNckeVSsDi
         vGB4CpUwtVERO6WjB0iUQC3HvZsXLiH9K8EPowTTfFZfSm3x0KDS3c4CDQngASPX60EJ
         JnpCQD7Go8sUKFemKlVuXLzOlf6A8gTdgeoI7i3vm0GsrKJqT5zgUE4faVT7X7Owj7pK
         A60w==
X-Gm-Message-State: AOJu0YyjrAkWXhjQIAvTgPfyEq3J8hgi54nMknTcYr1RE6Bug4v3ZfTh
	NfVH/NdwmZQgGQIybrGRn1ypJbwdKDtpHDQeqO96IEgzuAbOAxLyHPAgy/cnMOM=
X-Google-Smtp-Source: AGHT+IG/hCxSmlJrB+uKaj28OCu9hJlPe03uEFXEPKx6fHuK00XoM411y9q7ROI0AVmVQqkPPn1gXQ==
X-Received: by 2002:a17:906:714f:b0:a44:5515:3b48 with SMTP id z15-20020a170906714f00b00a4455153b48mr9519653ejj.14.1709711665847;
        Tue, 05 Mar 2024 23:54:25 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id bx18-20020a170906a1d200b00a44f07e55d2sm4367688ejb.41.2024.03.05.23.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 23:54:25 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 06 Mar 2024 08:54:25 +0100
Subject: [PATCH] pinctrl: aw9523: Add proper terminator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-fix-aw9523-terminator-v1-1-13f90f87a7f6@linaro.org>
X-B4-Tracking: v=1; b=H4sIADAh6GUC/x2MSQqAMAwAvyI5G+jign5FPFSNmoNV0qKC+HeLx
 4GZeSCQMAVosweETg68+wQ6z2BcnV8IeUoMRplCWVXhzDe6qymNxUiysXdxF6xsTU6PWg8TQWo
 PoST+365/3w+OBpbPZwAAAA==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 David Bauer <mail@david-bauer.net>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The of_device_id array needs to be terminated with a NULL
entry.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403061147.85XYVsk3-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-aw9523.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 3b35ef197103..4edd371c469f 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -1099,6 +1099,7 @@ MODULE_DEVICE_TABLE(i2c, aw9523_i2c_id_table);
 
 static const struct of_device_id of_aw9523_i2c_match[] = {
 	{ .compatible = "awinic,aw9523-pinctrl", },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_aw9523_i2c_match);
 

---
base-commit: 3ded216936392775d17bb22fdc480a48eb549961
change-id: 20240306-fix-aw9523-terminator-637ea1c11bde

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>



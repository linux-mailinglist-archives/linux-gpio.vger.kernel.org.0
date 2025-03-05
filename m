Return-Path: <linux-gpio+bounces-17084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D1BA4F804
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC04F188A523
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11FD1EEA33;
	Wed,  5 Mar 2025 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAJGQ0TY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E8E1F03D7
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160361; cv=none; b=AILumrD9MlDltfBI9drEp5oQ3YmatjVh+wCCRDbYrvyRjkYrJwQQlqJwFZgS8RfkiS/9c2f5xoBu7lTPrGAlrTwoQVhlhNFBYqW1DGFxVscfE4BzG34D5gFStzq75cleTd8+39Eilfd8WGcVblBm6pNlkj+KlFdiYRZMX82z/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160361; c=relaxed/simple;
	bh=aKUzsJKnxa0ztywZH0CofONFPLW5j11mzL0+jRK6M0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEeT+qxK1fBrqCaBMQJfwHzZs+HeCElACetpYgJGi9Z7CSuMCiGRe+oR1lFZje1PXFucvEhR/1oDYqMhybczeNPGgd/7KaHOaGwR0ZYgXIcuvYN70HKk2MnGOURQPK8v7g3HfMv74EED2anKt3tnQzpIBKitmrhVjKzBnZXVEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAJGQ0TY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a59so72997111fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160358; x=1741765158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6j98wzmws3yBjPpQCP6g3erFXEQ03ngjmGwTh500vM=;
        b=aAJGQ0TYghQ1+jkJMN3Sr8o58MpkPI3kJ0ibmO76TE0zdQGDIHp/uoqyT4BEs0QWiH
         ssvufMkfT5/7nphLwsx0i4KZaUTg9K+FtJFxj+u2GvSAIZm28LW5r2QoFRl0pWIAX6i1
         tcjul7GExQ0eSF/IwrcttOayxVeeHLnHBFKBljWCuJ4Prm/eH5AItgZJmFsYfQb0FM7w
         C+2+c90trD1di6KIj1xfg6AuqXoGOyfInGKNbxKaufqJUoJkWvFaXYOVjAoHgc6GXieW
         U0QtyiIOu0+VbsEidWOmsSPI29Hx6+5yda5M6TIqAtQ9O2aT25/l7G21mdUCyC/qS+eW
         M6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160358; x=1741765158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6j98wzmws3yBjPpQCP6g3erFXEQ03ngjmGwTh500vM=;
        b=QmAdeTe3ca13L4SXN0GJSaZYniXW4PrPI38Onq4DEvv5krAr2Vt5md48ysV9yUxLAE
         tjplsi1gN44uInXp7iJjRFEqzhqCwkdFi2AogEejQzsoT9bsN09SC/MtbNLub6ePL3Em
         fd1RN6L4XfIM0kwJmArNgUJAdzDgTVUKG/GttFyhws5XDA50yPf7rrw/rsUc97hsrZB2
         jgYWhCBHeYp6GQK0JKJj4tKNxnk0RfhRVqgSyBhxdZE09DFrEukEs+NHQYgbqlqpWDnO
         7xGTirVFapwFoF65DMluNm+ZxmAG3r5mfOo+OLaWM2bZ9JZN+1ejpaTbO4Zmj0v2JmUe
         n0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXQnrfcVjbe0j6Aty/I3rBQDPhfcah9Fv8wW/sHonowuXh8tU4XVbt1pE41RyMEIVnKSoTl86O1gd1M@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKFXSiNMdrxh0llVjMXpHinCojWtqvu8MbdCieno/UZLqPuxX
	0KaJzvKr8G4Ou9UfJ9pQN/l0Lvr1gA3mqimGKmxbtYBZdueNFg6l9jIEb8aGui4=
X-Gm-Gg: ASbGncsrnfRwqSjWNY8IyGzNCH2pv/rYJehmpwK3QZAvsvVnetvn0wO4Vda+OkW5p+Q
	2IiTqBLcLfPErbW9Q7DbZHV7Uue7zytj1tMZiSmankVgnCAqgQ/tWrZOn2RG5dGwkKZIU7KNaLV
	h7P8eKFFrcQf3+whn9OMacWoj1bZvWG0sjpRD392qrUw4zNkFhjdRgEa/bgpW5HGXoBkFH4J6E8
	lPt3Bdw2Tx55VMShWg/K9sOaxoL1pTcUB/KP68IzvkH8GOOdzC4gcB2OPBlnVkX9LCAk6qPyBCZ
	MXCzu+dAueffzBWyTQCMXaBi/tAVAQWU7B9PvSxljURDhhZVzRSUWk8=
X-Google-Smtp-Source: AGHT+IGMwrfa7udQAfBfFF3CQtvSnUTEAriZdTrADFcKxLMUZRIgfPtcVBaneZI9rdL95/Sp1Nv4Rw==
X-Received: by 2002:a2e:95d0:0:b0:30b:b28d:f0a7 with SMTP id 38308e7fff4ca-30bd7a5732dmr8079901fa.18.1741160357450;
        Tue, 04 Mar 2025 23:39:17 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:14 +0100
Subject: [PATCH v2 2/6] ASoC: samsung: littlemill: Drop unused include
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-2-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

This file does not use the symbols from the legacy
<linux/gpio.h> header, so let's drop it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/samsung/littlemill.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index c5260e101c2a136001c6273200fa35740e618829..9fa5e3ff9215164491839d6ffdf499a3eeadfbaa 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -7,7 +7,6 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8994.h"

-- 
2.48.1



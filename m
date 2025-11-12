Return-Path: <linux-gpio+bounces-28391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BBEC529F2
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA818426DC5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BD3258ED9;
	Wed, 12 Nov 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hX6YPTuX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE7244664
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955744; cv=none; b=DIjtw3guNJXgakZpceNczkP7bUxXfftxP7GSYLwpsS57y2EDO6EGjwCZ9c4BqM8JzaXFLalLxAjOEHuHyPxW/82rXkaJu4EQaWbHHWJHeMaLbMcOkdslP0IRd8RZ7BDAfcRnqw6fZxUlYK6O3HA8YGxvV0iEe/zqsWUHVsLaz7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955744; c=relaxed/simple;
	bh=HgxG4lGvDqlW7/AsnynclQLHI/pvxu2uFzPRwebWT70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxPI5rULUWW40UsjRhHqrmTGSz0ABj6iWm/AglJucypQb1s7iTSpIT3HSwo6d64BOKca+lSezLfLdSncCwhcB+tV12ryuJjGlSQHK2cwDq94v9rtMNjPOeapkSfpTpLCJ6ESti6w9HNFnVg94RUIh3143oPbKAtWglyaV36dB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hX6YPTuX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47778704516so4534065e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955741; x=1763560541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/PxI7IDG8K3Rp8aKLf0DGe+okm2zdYYk5VKmu5ka3A=;
        b=hX6YPTuXwEpmt+pSLK442iSQ+ke5QDBSPAYKAUIZUZu2QItcGw7GyN6pr9+IlgDDxt
         52ba7Sk30ByFd8/NAYSobaWI5A6Iey5bpZ+x0zY9MCAC8vJFDUMsyDPsozoAcMOPXk57
         4ZJ4M2Atf8uchy7FmmPKw1f31dsgXZwEu76hFkKeZAEMOFjeASB+zg4Aa5ov2jA78fMY
         A+GFnz3WlD/imVTFwFJWRyP5NAmgsavw6y43KSuA6l5e2gdzxxsZGDRDwgsXt41QrM8+
         TZtByVp8HCbj2ArkKXS+gsCZCz+kl9nEvYMQzTPiD48P5KWFTsRwF/uhHqwqGnXxHljX
         JNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955741; x=1763560541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e/PxI7IDG8K3Rp8aKLf0DGe+okm2zdYYk5VKmu5ka3A=;
        b=OV2qCotYeuDcgjgWmjdsjA6wysY85RtutEhwi2FKxjt/IKTF82yn9yfrCAiyo2FUZW
         k5j/8LQdqnUkI23e8MLNCUlIZpznPBtAD+1Nm9FhbgrcjHOWOdkEmITQZmWlcONwTJj+
         3h0Z2xT0puQDbUAX8ccaOBlyDfs2jFO4p76q6Mq5e+NPNdgOiCiptRzhp3xG8Ult7SO8
         ajOvURFBwOAw6m1Wn67GseKTmgAHWfd7yheBmeiJjCfT+pH1lhWZ7wnVx2+rdsrbqszs
         EFtOPnWwC7HA6JHbkIO7nI7ePcJHCC+j1T59b2zPNtoQKmAklD4gBZyZnBJoAoGIXieK
         9lXw==
X-Forwarded-Encrypted: i=1; AJvYcCVbW4OONOo+bcjjq+hQV0aLV9TwxVjqucc3jjZMdh1sTZjwH2qFrxcpjzG2egAAfR/wS12utz4sH85k@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFBn4oPKnr7RiNNwGoQKovJJqp2qpv6GtSVTRYLuRDisd/Q0l
	WClguyMBt8pj9RRXbX40ehdMxJbxkZyYNSSF8sjVbTQXGEEPM1PIB/TRyn/uiVczarc=
X-Gm-Gg: ASbGncunCWrfdDBcao1yJjHEDS2MTUFC5iWMEOu7lwZhCdfZNFAEBd7LV2yveAevIRd
	z8/WzbwLDLRq7cj4bcEI4ClzJDgcse5xHVft+ony+d0VBsxZMBjStWF6qklN8nmHV1L84c3i9v1
	IDK400QJRufaPPKsowvcnQGoRRbOOgWdZeSNx4F0Rnq6umcFRzdC2cSzvy0wFLc9423XJZPHf1z
	FqixiTHF1tCvh3hhUz/1qctMxDdrSEyBGY3VEBiwusFCjorvVq4jIXJbhfCAYkiyYGkexuyfqzI
	HO4Tog39fETHxAChSMU6r7Da8BCnUwJP+k+k82olCP/4HkyZXdchgqLvPyqqW/VesUfwdf0xQZC
	rE8Bmkbi6xSYWZf637JQ/7O9tzSxUg7U1ASRXwTC2unM+q4nHci0bg6HwyEfMi7uScbM=
X-Google-Smtp-Source: AGHT+IEkRu/791wAeVxaQxp1qqgS3vo3K65X5o46qGVaUvWLYsNeU5tcRsDz23Tdw5hX7vdTv1ja0A==
X-Received: by 2002:a05:600c:560a:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-4778b2eabcfmr2794085e9.30.1762955740481;
        Wed, 12 Nov 2025 05:55:40 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:30 +0100
Subject: [PATCH v4 01/10] string: provide strends()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2522;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NlwU7Iav+zXTXT3/fww0HPRb4T18AYGPoXkxkIX1TvQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHULZbr/rzo1SGp+CZMmaM8LAFTvG2Phhgh/
 gXknU2GN96JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1AAKCRAFnS7L/zaE
 w4llEACvO76e1Z+11Wt9stMT8nt5Xd7poTboTiqIpNa7/zy1Z0GEsEDf94lSJ/UH8LczyCwHVXD
 j8xWbDY0qNWkjv0JgLTClvjrOl85dQHdVvHxKeKP0ZLuiuscFQGpvZUTp8AsNWFQPEtlN3LLaiz
 ooYYDo77Ff8G5DbGYaDA7hpycv3vbEsD1pA1VlWzMOs03EN2jVs7ZP9LAwvujkEYtop2HO1fwXT
 +r4YkLwaHsGmCMgSxtwvslG3+H/fN6H/T0FuSIQTXrclWt39Gsxg2FxL1HxLPbu2zMWS0EL4pKD
 W5I7vww1qStuhvyBR1sf3bkf4Sm9pcvlpKLCJnmUxAAyzJOw+aoDvWajtnQua2DlqUy73VDuoJj
 UaitJ+CSofxBn+OMKBk3IsE20o5z7CsAdoa0S1wUK2dg8XxJqiryTzOT6zWJRYdCpauKD21/+E8
 f7SiuJZ7QyQkcDQBbpdQii6lD94oQFd8FMFNKaogV+/LBvE2FWUa4UbCfmYFcV/b+1xybajq6rV
 ZouVOU1i/FivCvcZfZtQ1akl9qZIMfaxB0czgHNdT3pajsiscNnqs929HQ5mORLG7SuNy3p586V
 hehheWhg7ZTbzJ/8FWiyOYgnKVprVvop3kDt5pBZIROAR7MXNCHZ93enl7OuPvUYhNKzAK9v5CO
 idZYiRwCMJSHIIw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement a function for checking if a string ends with a different
string and add its kunit test cases.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/string.h   | 18 ++++++++++++++++++
 lib/tests/string_kunit.c | 13 +++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..929d05d1247c76eb9011fe34250b487834b2d3c9 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -562,4 +562,22 @@ static inline bool strstarts(const char *str, const char *prefix)
 	return strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
+/**
+ * strends - Check if a string ends with another string.
+ * @str - NULL-terminated string to check against @suffix
+ * @suffix - NULL-terminated string defining the suffix to look for in @str
+ *
+ * Returns:
+ * True if @str ends with @suffix. False in all other cases.
+ */
+static inline bool strends(const char *str, const char *suffix)
+{
+	unsigned int str_len = strlen(str), suffix_len = strlen(suffix);
+
+	if (str_len < suffix_len)
+		return false;
+
+	return !(strcmp(str + str_len - suffix_len, suffix));
+}
+
 #endif /* _LINUX_STRING_H_ */
diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0ed7448a26d3aa0fe9e2a6a894d4c49c2c0b86e0..f9a8e557ba7734c9848d58ff986407d8000f52ee 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -602,6 +602,18 @@ static void string_test_memtostr(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, dest[7], '\0');
 }
 
+static void string_test_strends(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
+	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
+	KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
+	KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
+	KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
+	KUNIT_EXPECT_FALSE(test, strends("", "foo"));
+	KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
+	KUNIT_EXPECT_TRUE(test, strends("", ""));
+}
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -623,6 +635,7 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_strlcat),
 	KUNIT_CASE(string_test_strtomem),
 	KUNIT_CASE(string_test_memtostr),
+	KUNIT_CASE(string_test_strends),
 	{}
 };
 

-- 
2.51.0



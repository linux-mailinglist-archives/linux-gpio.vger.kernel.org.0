Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4645B8541D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 21:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388530AbfHGTv5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 15:51:57 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:16136 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388488AbfHGTv5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Aug 2019 15:51:57 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id F1BC6A1039
        for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2019 21:51:55 +0200 (CEST)
Authentication-Results: spamfilter04.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1565207515; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OEzvxhlE3UJuf4xtoza4rVxrUE4YeRY3kBEVBlsvziE=;
        b=UiUXTIqAk8u7Wag37Wo+Agj6PVXSzuN1caUSl57KSE8tOP05H60XUrZaejAIMX8/VRvvbr
        lTNw02+oRhW4snDOlIXDfG86NL6vh8dfBgOA+kckCWgAZhvjJ77nm1+N9vyfgKUT7HSRTG
        ld9dBDoQdqajmPxLMdcgW36bGDZA0Ginf0Op1aRuPXu+5s9BStxIs1uqpm4VRcsG6jd0aZ
        XpSx7nsFu8rQZzlLe/LAsZuSsj8breCadooeubjIh9mZNJIhQuolldqdmTShJ1tLAYPhoE
        /b7/LxfIgXmv/I68kuOSaHWl3M9u4BVhogZhp6cRiCk1WLQprRva5pKmbg4S+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1565207509; bh=DAKalmpg5kd1ZVhN+5FleL6qAx9Pt7aW7
        EL/oiiXuTc=; b=TBbjZ7QfpYcU+uBak9U9GpIojP0iIXxGFUwRVQecS6WmkNbs+
        h079c/be5IZNaINav8qpvp1PXpueXu+MVghZT16n2Y/2zHPVnj7hoqO4N9bvI7Qk
        ocguhvWPq+SCq+oZnhpBr6zuZC91Tgb5Cz8AcqoL+Fg4ULhr+09Pla84XRbrSju4
        2ebY40TDBZa9Cp4Y8Gtm62PClCQPFyUsMCTPEREd40Y7es8hamGDdNzdd4odp0gV
        n1PfiF4OQVe9uPmGPQqfEwclDtiA7TeRX3UnxaWMaJqO+/Pfm9iLE4nu+7OUH+tn
        NNaPUwE6F5g/sOk7LGFp80n0VlM6nSKiKCwwA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id XOp4IzSKJN26; Wed,  7 Aug 2019 21:51:49 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 5/5] bindings: cxx: Workaround --success run
Date:   Wed,  7 Aug 2019 21:51:32 +0200
Message-Id: <20190807195132.7538-5-alexander.stein@mailbox.org>
In-Reply-To: <20190807195132.7538-1-alexander.stein@mailbox.org>
References: <20190807195132.7538-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If run with --success, all expressions are evaluated and printed out.
But REQUIRE_FALSE(chip) tries to iterate over the chip resulting in this
backtrace:
#0  gpiod_chip_num_lines (chip=chip@entry=0x0) at ../../lib/core.c:235
#1  gpiod_line_iter_new (chip=0x0) at ../../lib/iter.c:140
#2  gpiod::(anonymous namespace)::make_line_iter (chip=0x0) at ../../../bindings/cxx/iter.cpp:29
#3  gpiod::line_iter::line_iter (this=0x7fffffffd690, owner=...) at ../../../bindings/cxx/iter.cpp:109
#4  Catch::rangeToString<gpiod::chip> (range=...) at /usr/include/catch2/catch.hpp:1959
[...]

Workaround by forcing catch2 to call gpiod::chip::operator bool().

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
This actually looks like a flaw in the binding itself that the
gpiod::line_iter can't cope with an empty gpiod::chip.

 bindings/cxx/tests/tests-chip.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index c9eb8e5..1c69872 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -70,7 +70,7 @@ TEST_CASE("GPIO chip can be opened with the open() method in different modes", "
 	mockup::probe_guard mockup_chips({ 8, 8, 8 });
 	::gpiod::chip chip;
 
-	REQUIRE_FALSE(chip);
+	REQUIRE_FALSE(!!chip);
 
 	SECTION("open by name")
 	{
@@ -102,7 +102,7 @@ TEST_CASE("Uninitialized GPIO chip behaves correctly", "[chip]")
 
 	SECTION("uninitialized chip is 'false'")
 	{
-		REQUIRE_FALSE(chip);
+		REQUIRE_FALSE(!!chip);
 	}
 
 	SECTION("using uninitialized chip throws logic_error")
@@ -149,7 +149,7 @@ TEST_CASE("Chip object can be reset", "[chip]")
 	::gpiod::chip chip(mockup::instance().chip_name(0));
 	REQUIRE(chip);
 	chip.reset();
-	REQUIRE_FALSE(chip);
+	REQUIRE_FALSE(!!chip);
 }
 
 TEST_CASE("Chip info can be correctly retrieved", "[chip]")
-- 
2.22.0


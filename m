Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA07A30035D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbhAVMk6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:40:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:47127 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727898AbhAVMku (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 07:40:50 -0500
IronPort-SDR: CwS/seXfsOeHe7HMyxWihyx8FJcArAO2lKMuZ9WFizjffgkcATd7ik/a9+SOrFRUfxJX5cd2rl
 dmDfa0uRnm9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179520759"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="179520759"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:38:59 -0800
IronPort-SDR: i+qKkExPyNb8COWADY0TxTzxATrFraW4s0GzLWpzUZFN3e1gVKNSpK6kvtBSBk8aBv5KETySs7
 n5XvI7SHTJFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="574626614"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jan 2021 04:38:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C7FFB12A; Fri, 22 Jan 2021 14:38:56 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/6] lib/cmdline: Update documentation to reflect behaviour
Date:   Fri, 22 Jan 2021 14:38:49 +0200
Message-Id: <20210122123853.75162-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

get_options() API has some tricks to optimize that may be not so obvious
to the caller. Update documentation to reflect current behaviour.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v3: added Rb tag (Bart)
 lib/cmdline.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index b390dd03363b..2a9ae2143e42 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -83,7 +83,7 @@ EXPORT_SYMBOL(get_option);
  *	get_options - Parse a string into a list of integers
  *	@str: String to be parsed
  *	@nints: size of integer array
- *	@ints: integer array
+ *	@ints: integer array (must have a room for at least one element)
  *
  *	This function parses a string containing a comma-separated
  *	list of integers, a hyphen-separated range of _positive_ integers,
@@ -91,6 +91,11 @@ EXPORT_SYMBOL(get_option);
  *	full, or when no more numbers can be retrieved from the
  *	string.
  *
+ *	Returns:
+ *
+ *	The first element is filled by the amount of the collected numbers
+ *	in the range. The rest is what was parsed from the @str.
+ *
  *	Return value is the character in the string which caused
  *	the parse to end (typically a null terminator, if @str is
  *	completely parseable).
-- 
2.29.2


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41567A34C3
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Sep 2023 10:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbjIQI7J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Sep 2023 04:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234547AbjIQI64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Sep 2023 04:58:56 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E15AC
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 01:58:50 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401da71b85eso38736005e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694941128; x=1695545928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aff0MNJXBJPd+CpLrhOQG/QAxEWELeCnZkX74TkfiBk=;
        b=ym9L/BR0wG4jXklo7kGOsYUTjNY84CQmitkIBUZUQUprtdCKXtM0F5RMRIAzZpymKv
         fagbC7IY03nWCcedoa5jR96rXK8v4nskCjS3ONIWFNfHf7KZLm67ItClveBM28puxCAC
         HjWkpMFTET+f8uQrPfdffJuBEiBVYzKYp9QwLKucht787cEGZ6l6/LhpNQfWxGIkWoH3
         YWA0+ChFaPea7bgcDaKdybJou6KBIiHAdvKgfJIBgOsX4TmEld0C6mCYxIC1d7gZkthf
         3e9FrjmIV9ZEdsWNkkwSBLMC63rw5C19zm4GOf0E7VjfyHVUofiYk4tpHdQOPDZ1k5/u
         lADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694941128; x=1695545928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aff0MNJXBJPd+CpLrhOQG/QAxEWELeCnZkX74TkfiBk=;
        b=qtkpRRnBf2uJFleRUhHhlommEN6bdLU3Hl6TB24pE2S4h7ha1GI0rU7w7vfCGXdb5/
         LlNtFJ1aOzv/xBlKzcjW/enhbd/PYZ6/G8YseOkLdf96cRElY4/rpszQhDBKmhNfOdP/
         x0Ht1Kt1Y5fyj+txho9eMeiPdkbVj+MeT8U/xn7ms1HRNmlxh7ipca16GyM+iMsRqiKp
         7/eQAPGnvaiNOTHblEKS0sa7v0U/yW/gn39oS22wijaqQnnlKUwqBTE0glYmgZn9Zc1n
         OI4Id/XydcAlIBLUsnxrJApR7PAvEnT2Bx0JEU2ryi4afrzpzuea1dU5rAzqghQeRjBt
         T01Q==
X-Gm-Message-State: AOJu0Yxy+hr1fLWnzihsFDP2mlO8lqDvZlQ2N7rRQQW2OK16pNNS1dhR
        QKwL+Om9tg/opLI2egJoq+msEg==
X-Google-Smtp-Source: AGHT+IFC9VfIsN/vUHR46sCDiKLAUlf0a04wAI7lPLDwSRPeu3eejH3RswwgYYca+bAN7X2kON2Taw==
X-Received: by 2002:a1c:f204:0:b0:3fe:d57e:d933 with SMTP id s4-20020a1cf204000000b003fed57ed933mr5612790wmc.15.1694941128515;
        Sun, 17 Sep 2023 01:58:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4ea0:9945:6800:8739])
        by smtp.gmail.com with ESMTPSA id r10-20020adfdc8a000000b0031aeca90e1fsm9240971wrj.70.2023.09.17.01.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 01:58:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        akpm@linux-foundation.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] gpio: sim: improve the usage of __free()
Date:   Sun, 17 Sep 2023 10:58:35 +0200
Message-Id: <20230917085837.6199-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Linus et al,

As discussed here's an improved fix for the invalid usage of __free() in
gpio-sim. I based it on your "maybe-sane" suggestion but unfortunately it
missed a couple details that make it impossible to avoid a conditional
initialization of the managed pointer without repeating the call to
fwnode_create_software_node().

What we're doing here is: we're creating the string array for the standard
"gpio-line-names" device property. It can look like this:

    { "foo", "bar", "baz" }
    
In which case lines 0, 1 and 2 are named but it can also look like this:

    { "foo", NULL, NULL, "bar", NULL, "baz" }
    
Where only lines 0, 3 and 5 have assigned names.

So the `has_line_names` boolean set when encountering the first line with a
name is there for a reason, namely: it's possible that only the line at
offset 0 will have a name, leaving max_offset at 0 but we still need to
create an array of size 1 in this case.

If the array is created and filled, then it needs to live until a deep
copy is completed in fwnode_create_software_node() so it has to be defined
at the top of the function.

I think this still results in clearer code then if we called
`return fwnode_create_software_node();` twice with the same arguments.

I also changed the naming to reflect the purpose of the array: it can be
sparse so it's not really "number of lines", it's the "size of the array
holding the names". The array can be of size 10 but we can only have 3
named lines.

To atone for the above, I've added a second patch which changes the other
instance of __free() in this driver to be initialized in place.

If this is alright for you, please consider applying it directly to your
tree for v6.6-rc2.

Best regards,
Bartosz Golaszewski

v1 -> v2:
- split the line name setting into two parts
- add a patch improving the second instance of using __free()

Bartosz Golaszewski (2):
  gpio: sim: fix an invalid __free() usage
  gpio: sim: initialize a managed pointer when declaring it

 drivers/gpio/gpio-sim.c | 68 +++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

-- 
2.39.2


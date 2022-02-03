Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6344A7E99
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 05:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241126AbiBCEWp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 23:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiBCEWp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 23:22:45 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAAAC061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 20:22:45 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id c194so1142958pfb.12
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 20:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eklVZby/+Hr8SSRgARkTvfHHPl42C69WPqA0+oyRXwo=;
        b=NjBRJIHn8heIKmVaT/agJp3jPvoP5nGqyGseBAvVRrsJZ8X1kZji+nRNOEu7nur+IB
         hyYpco65rwk/TnomGLQMpp//LIZgH7znaVinS3Ve2ZqBwBIOyqRHmU1VkXgX2/mENSx/
         piD9k38124Is03H+HFMlw+vVJH5G4+Pqu5mGIDBW1f9T42UajaK1YlvO11aJIzuTkY25
         Kk2iCIq6T95zxG99fMXr1SIPw6ydL5KyZPQDlaO8yiw5Sx0BKQmdlS0zkAlR0H+xwlA5
         aViyV6MfUXt1DbzOU0suY71idpfv1P9XmCF4EP2J5iIwzZryIhDjdtw6GyWgDPlyTTka
         Da+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=eklVZby/+Hr8SSRgARkTvfHHPl42C69WPqA0+oyRXwo=;
        b=7o8GqVJb4aTTEVQJVp9Yf6BNIwfFAV7V1KqQzVY2rggdALa0bVga7QYjSZ3R4qy6Of
         sLUJKNmXBHE6xkeiSYjHMSTPhPs4NruU24wnDFeqjHZc9KCQpazZEYBQjp8IV8iXe1dH
         eCnNi1h8FV9zi/nf7ILQfZ/OxoF8l8bCE7njCW1E7Ih6Nk6ofZHC4Ad/ASqrZwq3QMAu
         55+sDI8cVuF+5ab82DjSxipKRzHG6fAkGvmV5iTLonTmVFOhW40ERBrBJ80I9Day04Vk
         FrgsSHS4crihSCyzCqxVkN4z6E2WyxB051ToMiUnlxdaSTkk0Rmf9NuG3bUkgOcJWq+Y
         eg4g==
X-Gm-Message-State: AOAM5316YXNqtZOINOuvTWHd3ZPxSOHCmhq5JNxQ5cWjQohs0NDx4vLI
        NxgAJKJG3eVQ1nk87Wn0frc=
X-Google-Smtp-Source: ABdhPJws6c1/XbS+JoLNRXnBNtysyD8ES0IdwkdFIP3tlP0c+ya6nqlxH0KsrpBAmo1D5md2gK3Vwg==
X-Received: by 2002:a05:6a00:1345:: with SMTP id k5mr32682190pfu.37.1643862164393;
        Wed, 02 Feb 2022 20:22:44 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 20:22:43 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH 0/7] tools: Add by-name support
Date:   Thu,  3 Feb 2022 14:51:27 +1030
Message-Id: <20220203042134.68425-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series introduces a command-line flag "--by-name" that means
"line-specifier arguments should be interpreted as names.

The patches implement the change for gpioset and gpioget tools. Once we
have settled on an implementation for those tools it could be extended
to other tools, such as gpiomon.

The test suite has been updated to cover the new option.

An initial discussion of the idea was presented here:

 http://lore.kernel.org/all/20211201072902.127542-1-joel@jms.id.au

Joel Stanley (7):
  tools: Clean up scandir memory allocations
  tools: Add line name to offset lookup helper
  tools: Add value support to line name lookup
  tools: gpioget: Add by-name support
  tools: gpioset: Add by-name support
  gpio-tools-test: Add gpioset --by-name tests
  gpio-tools-test: Add gpioget --by-name tests

 tools/gpio-tools-test.bats | 184 +++++++++++++++++++++++++++++++++++++
 tools/gpioget.c            |  57 ++++++++----
 tools/gpioset.c            |  68 ++++++++++----
 tools/tools-common.c       |  76 ++++++++++++++-
 tools/tools-common.h       |   4 +
 5 files changed, 352 insertions(+), 37 deletions(-)

-- 
2.34.1


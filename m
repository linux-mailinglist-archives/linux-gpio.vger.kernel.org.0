Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AFE4D5C8A
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 08:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237190AbiCKHlD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 02:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235948AbiCKHlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 02:41:01 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D609A4F5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:39:58 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id m2so7087540pll.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=owGphKK1rGYeT5QTcJiJFgYdDs3LoEMRRi1fxdGM6hw=;
        b=EVwa8SLjPsj8pmj+ZewxyS+eA5wn1NZGAvRdwyPhJpjdVrf4VwlbnjSNXoyhOz6Gck
         YFnIChEsbEthn6v9eEiFxZGlKR9qpD13/XIlvgFFWKbZOv4H/IL4mhSIP8HO75yKQsLe
         WZ4TsjUSlNY51ZI0v+VlchfT6DrZlhGA+6TEY2CWUMIteZH/x/3U3Pj/wOxasJVv7Ps6
         HbwXgWJMZawxEi4ZpUOXez/rj0NJkBBeEebExmqZowMWFlAkzIBQfwnDdJG0PDoXopjD
         eAwRC315ox0QYepD6JBb89t9hybB+FsFZV69AGaTq473ougaq2+rxBwyBkLYnTxIy8zZ
         bmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=owGphKK1rGYeT5QTcJiJFgYdDs3LoEMRRi1fxdGM6hw=;
        b=T7R61jrazeXRQ4+Gg1wGZkvcR5hBZbKH3Dhn64/qwHQ/1BIvBwaCvYwODLiOfBUltr
         z+/8YFSR4rDFbI0ygOFOrlKoAbC/FbHFmU81koeGX0JXDXwmMSKPYyc8AiYyEluQaca8
         0Bhig+9mkulhb7ypq7Ik0dLRFsVgHYRG3EFVK+6FVkS3GuJcs+WIdlvSeE/wgR6SakGj
         r/0fG/sKtra3Q7EzN3q66pYWoLwTz7GySAlb1RV/ion5MW5ulFJ/I7UPgzEqN3p2Ow2b
         vGB7pTr6xpCtkUor3ZiRzR89G0WcT7Gd5bDyUcCVDWh9DvhW+1rG2zLNJvhx1jfFLNds
         DCEg==
X-Gm-Message-State: AOAM5318S72pJzUMyiSUpK2bEfweUT6EqTkDCQnRPyyUb7iFiO5IHzRh
        Du2vHEQS8WUjiUcP60TCiO9g4hibGWANHw==
X-Google-Smtp-Source: ABdhPJwTAgyBLfR3Gp5gYxQuyCVMR/kJFYB3xsXdQojjcdUvY8dmK7YBbg4+hFBcBKrMCOPv5hnDnw==
X-Received: by 2002:a17:902:7892:b0:14e:c520:e47d with SMTP id q18-20020a170902789200b0014ec520e47dmr8642979pll.105.1646984397095;
        Thu, 10 Mar 2022 23:39:57 -0800 (PST)
Received: from sol.home.arpa (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm11973981pjc.56.2022.03.10.23.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 23:39:56 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 0/6] documentation and other minor tweaks
Date:   Fri, 11 Mar 2022 15:39:20 +0800
Message-Id: <20220311073926.78636-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bulk of this series is the documentation tweak pass I promised when
reviewing other v2 changes.  The rest is a collection of minor things
I tripped over in the process.

The first is expanding the usage of size_t within the library to cover
the occasions loop variables should also be size_t.  A noteable exception
is for offsets, but those are defined as u32 in the uAPI and unsigned int
in the libgpiod API, so adding another intermediate type seemed like a
bad idea.

The second and fifth are function renaming for consistency.

The third and fourth are just renaming variables for clarity.

The sixth is the actual documentation tweaks.

The changes and reasoning behind them is as follows:

Fix a few typos.

Add "::" to symbols doxygen links where missing.

Use "\p" to refer to parameters.

Fix space before tabs (triggers a checkpatch warning even if the line
isn't changed).
Indentation uses tabs then spaces throughout.

Change "@param offset Offset of the line" to "@param offset The offset of
the line" to avoid checkpatch repeated word warnings :-/.

Use "Get" to describe getters, rather than "Read".

Use "function" not "routine".

Drop "GPIO" from descriptions where it doesn't add anything.

Drop use of current/currently as it is clear it couldn't be otherwise,
and adding "current" just makes this reader wonder how to access
non-current.

Some rewording to improve clarity.

Add some @notes to cover misconceptions or questions I frequently see.

The API is all about chips and lines.
Recognise that "offset" is an identifier for a line, just as "name"
could be. So don't use "offset" as a synonymous placeholder for line - use
line.

Use "num_lines" instead of "num_offsets" or "num_values".
offsets and values are just attributes of lines, so num_offsets =
num_values = num_lines, and num_lines is always appropriate, independent
of which set of attributes are being described.

Use of the definite and indefinite article:

In general, where something is not unique it is described using the
indefinite article, "a", but if it is unique, including where some
selection has already been performed, then use the definite article,
"the".

Only use "this" to emphasise a specific item selected from a set,
such as when referring to "this function".
Generally "the" is better, and avoids any possible confusion with C++
this.

Generally use the indefinite article for @brief descriptions.
e.g. "The function does something to a thing."
rather than "The function does something to the thing.", as it is up to
the caller to make the selection as to which definite thing to call the
function on.

For containers, an attribute of the contained element is definite, but the
element itself is indefinite:
"Clear the edge detection override for a line."

For snapshots, like line_info, the "line" becomes definite as the act of
taking the snapshot selects the line.
So "Get the name of the line."

The @param and @return use the definite article as they either identify
the article, or refer to a specific article, not the generic operation
of the function like @brief.


Do NOT ask me to split those out into separate patches ;-).


I realise this aimed at a moving target, so I'm rushing this out a little.
The commit that this is based off is indicated below - the current
next/libgpiod-2.0 head at time of writing.

Cheers,
Kent.

Kent Gibson (6):
  treewide: use size_t for loop variable where limit is size_t
  API: rename gpiod_request_config_get_num_offsets to
    gpiod_request_config_get_num_lines to match line_request pattern
  line-config: rename off to idx
  line-config: rename num_values to num_lines
  line-request: rename wait and read functions
  doc: API documentation tweaks

 include/gpiod.h              | 712 +++++++++++++++++++----------------
 lib/edge-event.c             |   2 +-
 lib/line-config.c            |  36 +-
 lib/line-info.c              |   2 +-
 lib/line-request.c           |  10 +-
 lib/request-config.c         |  26 +-
 tests/tests-edge-event.c     |  38 +-
 tests/tests-line-request.c   |   2 +-
 tests/tests-request-config.c |   8 +-
 tools/gpioget.c              |   4 +-
 tools/gpioinfo.c             |   4 +-
 tools/gpiomon.c              |   4 +-
 tools/gpioset.c              |   6 +-
 13 files changed, 449 insertions(+), 405 deletions(-)


base-commit: 6e15b78d6e9c956c295c755aed793ffd963b1c53
-- 
2.35.1


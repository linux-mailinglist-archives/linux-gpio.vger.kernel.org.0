Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CD9268964
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 12:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgINKjG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 06:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgINKis (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 06:38:48 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6E2C061788
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 03:38:32 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 67so2010410ybt.6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ICf871p6+VxKhcHyaOo9+1T2EGI2AKBiDDJ03n/yiiw=;
        b=llPgsD90iUjW6mnNfU2/lcrlTQxam9wrcR+Yw0r1Zyoy0vU6J8QJGFpDPjpdUNWf/j
         3MICHoYyRuikg7okCo0NfIs35aR1a0ZEDkUh6DAM5dN/KtZz7x8795zU2rRRGuey8e3/
         pSRZhQ7/3kRhaipjs4o7/syLyXO/8wiWzHwBqTFzwDheq4NQXObKB6t8dX2iGfH2VCyT
         pyPWV9mhbHQ6T94G0yaIutqQmxFwctd6mBDB7Cbglm0NL7i5YfHcVsEgcwy4Ygui9fH0
         VqZl0IhI49e+DjvyL19YN92Jb4rypjvtCy124K/Dtn96dnOg26XCp1PnHr3xt5fN8DR1
         UYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ICf871p6+VxKhcHyaOo9+1T2EGI2AKBiDDJ03n/yiiw=;
        b=ItUpzViNTCu+OYivsiC8DfEIEy5VEX5Blz1JQP1YqGr7jDTqG2l9ylDJ7s3nSZrXoG
         6IcplhAfsJ3YsV5zdCQv64rTLGq77sOQEL7MFwzRDhD5CRgKo96XrC56XDkfwyC897Ir
         NeIiPCCChMw60EhnC5Kp3Z2CRmCKBOrHL+n5IwnCEu+Uut6HVcpW4LhySTAOkbFqD2Wt
         D2BcqwcQyxw3BmQQ49+V7HtEKjiWDFVtD0r2wbrp0gepJXk81NPfzA0T0laJFJ4d3owl
         Y0+tVIhLSpgyOf6gITOPiCKugM5xzqQPy5A/5Xju/IP78J8D47K79vTUiOL94va27220
         UurQ==
X-Gm-Message-State: AOAM532cMuk2vyJWC9iyUSYFDbntXXLAxc4RTB3wJWE710z+WxHApBqy
        JnP12fUUwdOqIFPh0HRLXey+ikDao/ywBhO7CF+6bFh0qnM=
X-Google-Smtp-Source: ABdhPJydMjpmdJ15QZH8NVmlaUex2u6eQKOAGYiZ5YLBbjWbK/d0ODtMUL11VXs2PxXdf9nYVw+BkEQ8MwTp2qxsjTc=
X-Received: by 2002:a25:9905:: with SMTP id z5mr18122632ybn.38.1600079905726;
 Mon, 14 Sep 2020 03:38:25 -0700 (PDT)
MIME-Version: 1.0
From:   Maxim Devaev <mdevaev@gmail.com>
Date:   Mon, 14 Sep 2020 13:38:14 +0300
Message-ID: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
Subject: [libgpiod] gpiomon loses events
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi. I noticed a strange behavior of gpiomon and gpiomon.py. It seems
that in some cases, if the signal arrives at the GPIO pin too quickly,
the last event on it may be rising, despite the fact that the actual
signal is already set to 0. a Cursory study of the sources showed that
both of these utilities read only one (the first?) event from the
line. I changed gpiomon.py rby replacing read_event() to
read_event_multiply() and iterating by all events, and it looks like
the lost faling events were there.

So, I have a few questions.

1) Is this really a bug in gpiomon, or is it intended to be?

2) If I use read_events_multiple(), can it skip some events? I noticed
that sometimes I can get several falling and rising in a row. Why is
this happening? Shouldn't they be paired? Can the state transition,
i.e. the final falling or rising, be lost?

3) It seems there can only be 16 events in a line. What happens if
more events occur in one iteration of the loop, such as 20? The last 4
events will be lost, they will be available in the next iteration of
event_wait(), or the first 4 events in the current iteration will be
discarded?

Thank you for your attention.

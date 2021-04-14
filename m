Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1E635EE2B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 09:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhDNHKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 03:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbhDNHK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 03:10:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3292C061574
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:10:00 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w8so22971940lfr.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 00:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9iIuL28IIt3ZoanfWEQnNr5ecpSviGQy2UybO435g3Y=;
        b=v8X3POfyLK8OYyRq1cVUH/mo47MfFVfiqsPjsSvVldl+OZPr5Qf/RGPlEpbHAZKrhH
         xhvdlqNiG6pSxBrKB8+3nb43sKTKHiMStTzIjNjU3Y3bMzgG5sOe+UoxDOrQTCkplvEG
         nDodccWKqhgYJ1xIT9gMreCM+ayEvDPsyJutQhfkZK0yEXcd20MPkAtMUcgh/A8y4ywt
         5bRtaCT1lcnDgtlxEpgpC0xLuG9jkQASq15ZuzkkzkXOnCfo0tQbiaytheFP1jQK+1Ns
         MTXKAtX4ug1ohBfSCzNWrHYg0tNOdhSxI1UhFTojihG9+DjJK1h4b0tD7SyaXuJSxlP+
         yQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9iIuL28IIt3ZoanfWEQnNr5ecpSviGQy2UybO435g3Y=;
        b=Kmd6WK8wro3LeBp90wVrLAL4V6vXwYT4Si/8xqSnjDPu0Z7K4YYa9kY/awXixalSRl
         SxsgOn5gWxp4dEByOZx7y436DNDsCVFep6qmUckfZ4TRSIVvGLyQXSWyw2Fy03l9hRQG
         HnkbWrEtLrwJ/Pzbi5gbqWobyfsNb+SESiq0wdrQiWpzAwbjrPXZozmwmQ/xHmopW5CW
         emS7soVYjJrtX6YH1WAaeWtjfB6i2O8oVVeXUiaF3oWD6WhSvurWeADlED79mZxYutOI
         NqA2Rgrd2VZ/zPKW3bAtF9vIKHcRRcePruraXqLsJJZzBerfmOXFL2Lz9Hxw/YJZFw5y
         7fqg==
X-Gm-Message-State: AOAM530jKx8fDw4S5uRKGMQ+GEHhreLKZ+3knro9Tr4Cd43uAKDobqO+
        Wk8UrjXtZ5a1mzLiJJhxHn8KxIF0Fbw1Jd7ZPjuvV5ODhdwlhA==
X-Google-Smtp-Source: ABdhPJwAgWEinmyD4VeTdYiz0OyX69yP3GS0QvWeqzlIoLM316hs0HmddWAMvMG4n2/zbk3NoQ2B6Ogn2T6Xc+a/p3Q=
X-Received: by 2002:ac2:529c:: with SMTP id q28mr13755846lfm.586.1618384199306;
 Wed, 14 Apr 2021 00:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <YHV9FBeAosyf1Efj@black.fi.intel.com>
In-Reply-To: <YHV9FBeAosyf1Efj@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Apr 2021 09:09:48 +0200
Message-ID: <CACRpkdbgAEePVUhGLRv9XK2LPTTResu5sb9LH7C-A9jt+TfZNQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.12-4
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 13, 2021 at 1:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> One patch for v5.12 cycle.

Oh urgent stuff, pulled into fixes, thanks!

Yours,
Linus Walleij

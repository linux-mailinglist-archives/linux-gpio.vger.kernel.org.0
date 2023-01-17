Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9708E66DE80
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 14:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236204AbjAQNQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 08:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237075AbjAQNQL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 08:16:11 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C7D4C07
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 05:15:57 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id d62so17770905ybh.8
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=speSHNYY7UY/VdkKSKSzAPd+LB5tLtqCK38I+sQK0WE=;
        b=iuY779kCZkgs1i3TJHyaoB2OYp2y4UXVeAhDi5HqtuGQfjKC4jG8HrnzdB6SN3EkR/
         2nYFg5Zh5RbwdAQZGyYwV98xO4AgZMxYK3B1mx4o6KgC1XnnhnFP6AiB0VEVt/YxERde
         flKtvACWDm+891ml32I3GsO2iYHLgotbUxkvM8kL3CQOZ0u2UkENSHolMuQMLhMKE/xe
         LTQmekU+6z1QwVRup+9f7At80Pf/R1cuRMQW/4eoFu2M13dTL4WwmITVWqu5r14EUtAA
         Yg75DI449A7EfVw1LH1SuSVZpyOLLnOtCnVf2xcq6lyTfjyN/95YcJ4kwMkwfwb7yYF/
         YFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=speSHNYY7UY/VdkKSKSzAPd+LB5tLtqCK38I+sQK0WE=;
        b=vgZ81WGFnTGTdeZyNi5iPR2bqUlVqzF7EakqWPC+d5EShtCDf+5excESEyKx2rdILR
         8CKv/1QIDjl3cIf7p6+g/P7TlEHNa+vzYUBt1BMyoYJyvQEEqjQvNr64e6G0mo3872fx
         oJVY4PyN+QDcFVSvOPzc2+JJOWljDgme4eOJ5EPiRikx0l1UuvCnCBmKv1zeL3wUgDC1
         KWc9sgFAP7uC6e1yh/IiWXQJq48NFXZntxP9o/ufuw6Mj6uLie/3NXj4SJR4Jc/+Xq83
         lEqW6Nr1GwAqDz6AlAeb0kAqNYWugEsr6dR79D+8XLDcokeY3gyOvlVdlFuPQ1F9G4a0
         TSVQ==
X-Gm-Message-State: AFqh2kqyRo2L9DQwv19gcfNDZf2wBObr1DXfFz7tV/UXzlGFmqbc/3gc
        iWO0LriccIl3f5MXRF6Ua1EYBjZ3kvoIU+JKZ5bfY6CUXsoDPQ==
X-Google-Smtp-Source: AMrXdXtQJRhkiJoJn3gtcZ2O1RYFepN01V3AepnypVv38ICpDuM0Nw4YvhauZDgojFLioy3ywrONiSypPavhEKGex/U=
X-Received: by 2002:a25:9d88:0:b0:7c0:acd2:6300 with SMTP id
 v8-20020a259d88000000b007c0acd26300mr320846ybp.520.1673961356936; Tue, 17 Jan
 2023 05:15:56 -0800 (PST)
MIME-Version: 1.0
References: <20230116153347.15786-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230116153347.15786-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 14:15:45 +0100
Message-ID: <CACRpkdbVa3XEDzcuy7iCqx0cvj4trzPe7N0B5PswA1mQ7O+GtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Proofreading and updating the
 documentation accordingly
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 4:33 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Proofreading and updating the documentation accordingly, i.e. fixed:

Both patches applied! Thanks for your usual attention to details.

Yours,
Linus Walleij

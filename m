Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 378BB4F41DC
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Apr 2022 23:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243091AbiDEUUB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 16:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351239AbiDEOz7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 10:55:59 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD1436174
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 06:22:47 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id p15so26647029ejc.7
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2022 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ArxUbiuZW45zmoWln4XidCmaX5lVZ1fz/MoyRJCJrzc=;
        b=WyjTjD250UOOOcaMHf+btUSOzVb6K4fm/+8z1PkXSK/d1lS8FXzz+mXdo9kmu5OIcx
         MKkyTYyofz3b5Vdeg5aI689W4jqD2GlfZvq+x6mvB65xOMXIIMj/skrvI7JkKWu0OMPO
         r4c1wLet+uix2eAIDBsv6a59HTkbAq1KSxQaxAb2t8YeCels8LsV7MDVmxGSPTIhplEE
         9BnUP5JGLpftcJk0AJsqEew593rFq/693m+lsxAytlXFZidN8vVIBMkb72OKWo5DihUi
         A/AQgGmjIL1tsTsaRc4042z0kbqax/Q1uiCSAcN8NvGxFe5cWAJRa0vYg0y5zHNjRIEo
         7eAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ArxUbiuZW45zmoWln4XidCmaX5lVZ1fz/MoyRJCJrzc=;
        b=Sfzhvjh1E+7PxT9GA9u23CsZlkpm856HX1i3KhJeGWbg1JiDKb6S0kb8mc5fnwcrMS
         jOUO6e/Jc+huoCq3oG/yEKZhqgACXUuFVoaiQ2PWtXtDUrUPIPD0z5Dm7gTwGR5rBYgi
         8pFHutu+8LewPxh10PEXvs/psfszXEWGYF00urqAondwDY46LceSdzX4YTT6v5l5kxBo
         xQqcbMW9DaGJJtrpf6DeD2lPudLciCcTGtMWqOFbBXQMywwep1LhK96o70SECjLfEKKk
         7KlTXSkX6ClyDB1OvWFjHj51aBt62oJwGsSsfSzmqgf9ZYvh9sBYO7JCWmJgxHxQXRvH
         d40Q==
X-Gm-Message-State: AOAM530/tfDwpmIRy9q+n05W8bl6EPR2vM2WbfLYIrLVhL6h5CEmQPgE
        ryK6yXwJq8uHfKQenOS6K+tVCUD+/rCjMhpyWYYK0LRBnq+uzw==
X-Google-Smtp-Source: ABdhPJztxYX98yWbJiTDM/Z50zf4RY1c+niI0HpF/9BQcL7jg5QWmkDrDQxafYmWHSKH9gMMc5a8x+UTj0MNid8/b7I=
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr3714997ejc.286.1649164965670; Tue, 05
 Apr 2022 06:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220405132158.33433-1-brgl@bgdev.pl>
In-Reply-To: <20220405132158.33433-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Apr 2022 15:22:35 +0200
Message-ID: <CAMRc=MdcVdJwB0zcJX0gVRWw-EhtTCs-eYtFc76p12PzZcLfeQ@mail.gmail.com>
Subject: Re: [PATCH] API: rename gpiod_chip_find_line()
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 5, 2022 at 3:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> The name "find_line" is quite ambigous. We should indicate that the
> purpose of this routine is to map the line name to its HW offset.
> Kent suggested get_line_get_offset_from_name() which is hard to beat
> when it comes to being explicit.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---

Ugh, this was of course supposed to be [libgpiod v2]. Sorry.

Bart

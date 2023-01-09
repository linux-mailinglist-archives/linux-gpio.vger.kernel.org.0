Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06BB662684
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 14:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbjAINJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 08:09:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbjAINIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 08:08:54 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8AA63DE
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 05:07:46 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-4c7d35b37e2so55303247b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 05:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=meCBUNiYCJVjvPgfCLjO9nKgeILcQjqa5SqQX9O7wlk=;
        b=QvbYEkF/kBxWUdlUCzvhLVSrsrV45GRs+N+SVPq3wuksysSF2HyQAnww6YgDkmuYee
         SXGFMDc5FS6pnTW105HgzzhFE3JhtOHH1LWtiHPhSF5wnovo41AIDb1QDOxvS2z/OR8C
         HqQy2N5Gt7NQGHrfzjz6bFLo9PWZkUAM4JCm0x9Lc1qcQScYStsOtl80E1jeYKhb14EJ
         9xD5/+mS2bI+/hRGrn87geyUC5hFtNaz5fWwIwC4zjbP7PyXwLoNMR/LeXkWHD89tQBQ
         q4QrtHkFe+gsxc4dck0QM9Qi1q7cotP8WWoQxFw0YTZBB77vYGxGr1//n/J6Sa19Ypvz
         JV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meCBUNiYCJVjvPgfCLjO9nKgeILcQjqa5SqQX9O7wlk=;
        b=nUJ3PJA7EAz1KHWckfN0vxSS8Yps6QL+faZC2g5+7nzH14/GvgnR/SjmqSb+ddhWnV
         AU6m7W3gC696vVIYX0RnYarmO7JFbLH8EsrKO1pl3STg8BzoFBgA0Nr74U8vbu5R/+jF
         aq247QntadPtFr18uLOgBB8D8X0n3OitJM91iKEnD42qSq/xYdXZmpJGJMa49HSzHbg5
         +iLNWomxHvngueFISi1HdaUTPoTERq2DaEYotp2n1oItaHLARC0/hyEn2mYW1Z5lrpME
         ke2C4ejSgz5tjTgeLDXRRt/Y6izt7VI5mPKsTlZV8WZ1jDoM6Bqbc7A3w2F8o6zH+3na
         my2g==
X-Gm-Message-State: AFqh2krJDLolJEMWdf0ZJIRpjhCwjtdL4ADBn7XcifUBJk8/ViIqL1Xx
        frMcdVlKfCwhkKnBZAD4wEnHrb00InaME7y+bQgMWw==
X-Google-Smtp-Source: AMrXdXuipzi7rJ//l7lmNR18voM6rfTP6DnQw5mKeSRlaZKqGt4PnTXqh5AiiLQlzwRfCZedpTlg4dXJvZL4I5ZG12I=
X-Received: by 2002:a81:9c52:0:b0:368:e8a:3b1d with SMTP id
 n18-20020a819c52000000b003680e8a3b1dmr861406ywa.469.1673269665839; Mon, 09
 Jan 2023 05:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20221219192016.1396950-1-dmitry.torokhov@gmail.com> <20221219192016.1396950-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20221219192016.1396950-3-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 14:07:34 +0100
Message-ID: <CACRpkdZwBbGqt+ro9XiDpKSSaWtDwgrB36A+jKu5N2ssm3T6fw@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpiolib: of: remove obsolete comment for of_gpio_get_count()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Mon, Dec 19, 2022 at 8:20 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The function is only being called form the main gpiolib module, so
> remove comment saying that it is also used by external callers.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

BTW: good work on this, much appreciated!

Yours,
Linus Walleij

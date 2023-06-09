Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 005537290DB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238390AbjFIHWf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238527AbjFIHWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:22:24 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69CAF5
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:22:22 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-3f80cd74c63so14001021cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686295342; x=1688887342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVpsaai4Jt7eFY7RyUO4SlpJRSPWQGSw2+xWXF1FmY4=;
        b=x2n6klbz9Jo+rTRFLLbdLYQNHMgwEt8L2wh3QmdDl8BhUsSiR7D3uwNH+K0iH5P4wn
         OckEjWYuzxfXRzQp0BSls/J9dfekwT+xhcNHsSiOcn9/rQ63M72qR7FPK0Dc4zQ9EZya
         ooPq10hnecvknGwzz5aBcGZMqnQg3k1VsYAV+oJHovFLsIyiua30Dc0GH7+WteIxTRQ2
         TfZrqTCWSKike6I19mgNxmjv8lSJyFGTgGEWR+PMq1KVpq27gxK/lJvxNVbxpAj9Cuwm
         7oJ9ncUkGEcl16AEn5vszy1+fDS3jnOz3lQb/jHzUH/vXA5nCW5aWmOg8T1diOpU7hWN
         DF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295342; x=1688887342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVpsaai4Jt7eFY7RyUO4SlpJRSPWQGSw2+xWXF1FmY4=;
        b=lMLwJDXzclTy5KsTvaPS2a7f1KouftqfBAoSKZR8pxdY7Inb60JMniIitS/+S/E+20
         A9dR6KtV2+cWdmL4QDGVL8+Ud/6os1ZUIPnUIDjXjkGQM16vmq4wExej8Dqam0HkpPEN
         FZix0HEe79GZMQHmHnQuuHuAFUkwyZyWdbCgi4kk2H2etic7r3BdJrnQekKzgh/gOiLc
         xx9u9FYY1Gj+XCLxqAtasBgAJ4Afe4wmzgo3pGs0OOIsY8wxYPKifa/WpQqTtiddKTWE
         jhlYxeboMGUol+KwsKmbUnvfMUhYdCZhFocXDxpipmQbZdY/3WkPV3VxhNhRHo99jKSJ
         Dcgw==
X-Gm-Message-State: AC+VfDx7MCAxb8SNR/iDteGB0rwjHjY31ruiMfiEJUcckKlz425JM/kg
        DRJzQQzhzuYnBeAij94ordil+2Y+xAZgUn7Nbrs53Q==
X-Google-Smtp-Source: ACHHUZ4Oehi9EuSyNZSDMalTrwOcja6xvYazaCuTYon20QIfy7fEeemLPBsvMnUkimEH6NVue2Ks1qaEhtt7FghaJ1Q=
X-Received: by 2002:a05:622a:148:b0:3f8:20a:1c6a with SMTP id
 v8-20020a05622a014800b003f8020a1c6amr944271qtw.40.1686295342169; Fri, 09 Jun
 2023 00:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230604131215.78847-1-andriy.shevchenko@linux.intel.com> <20230604131215.78847-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230604131215.78847-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:22:11 +0200
Message-ID: <CACRpkdbq7nKAk5ydw+b+PRjFGf-z_1rAwNwpLgntmfg-xA0yhQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: Relax user input size in pinmux_select()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 4, 2023 at 3:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is debugfs and there is no much sense to strict the user from
> sending as much data as they can. The memdup_user_nul() will anyway
> fail if there is not enough memory.
>
> Relax the user input size by removing an artificial limitaion.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Fair enough, patch applied!

Yours,
Linus Walleij

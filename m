Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C29920FFA3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 23:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgF3V4A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 17:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgF3Vz6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 17:55:58 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A700C061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 14:55:58 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id f8so12202065ljc.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jo5AKAy30p97IybGdrTQaQDtwLDLgfYe1U7tXE2aWPQ=;
        b=Z6fzgBO3/Z1oDA216CAvUXmfQAEpRf0B4P4tn45ElfhJthcAjPNioxHAvXF7RI9TqM
         m/nx6rPHPgVe97ehrfUA213xf8E8J9jSjmBTnbwbLmgC0AswNTYBkyauPAyn8P6hdeGT
         eHOXKlW1SrL/CtlCUa288ynNPb7E1mkdRzigWd3UVZAKf1ihZweOU3RRRZc5MwxqgVPC
         uUdjwOYHL/OMEO4TAr5Rzb73nmMMS9Ou6pSpLXk6HVVBpawUyc0gr0QdhryKmG8jzJ67
         2qtD/IAJaLHTPgq7AjTPA1r1KCun2jq1MoyYtzMSklrjmJa5TDRRHIoemQEN3kl8JngR
         JNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jo5AKAy30p97IybGdrTQaQDtwLDLgfYe1U7tXE2aWPQ=;
        b=r989jNX1oSYC9hcc1fzniFR+IxKxUL/TeXPNcX3uxMaCaN7iWliiqOJgb6Tk7j7QIB
         8DRm0xgkNSZyChPZgC/bRJ75r5d7o6wMDwajXyrvWxtgEetz1iFj1qUbLhSP7RiwnSUg
         B1erFOD7EUWIo38sbzkHO80ayGtesZyygY9i0I7lGUFiznIfOyzc9nA4zSGa/CqhcanH
         6DHd0OKzOZCTmWVAAAxBLDlHTWX7NabEkXINV+mm+m8asAPB9ACPsJIbko/125LBTz+2
         6BjyibhHK0XzS/OA3iPNOxxrURFiqof7IFmUa9IAIhQMEIFhMK22oeEPh1UNTmJOVQh9
         +aqg==
X-Gm-Message-State: AOAM531JBrxwRJvCGGWU8asD0vtVv8Vy8XQr4mGQb1a9+MvxI8US6Cg9
        HCVBksN6CapOxyxnQ9exkUbYie9cXd1alNJVpZI4wr8nK+A=
X-Google-Smtp-Source: ABdhPJynYpSXz+3PTG6b/ZA/Wk+LgpCF/1OAXwQ+9onXJpxuCUKdcxGGv+ZHrcY9kJWf4sEcycDApiPQjbUMVtqqoqs=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr12367607ljc.100.1593554156728;
 Tue, 30 Jun 2020 14:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200630105443.29954-1-brgl@bgdev.pl>
In-Reply-To: <20200630105443.29954-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 Jun 2020 23:55:45 +0200
Message-ID: <CACRpkdYp8KNWzmHEYd=npMqd5QfEhxgHC9CfcVP3v+60uvn5uA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.9
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 12:54 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following changes for v5.9.

Done and pushed to next!

> I'll be on paternity leave
> in July, so I may be less active during that time.

Oh that's nice, loved doing paternity leave with my kids, enjoy!

Yours,
Linus Walleij

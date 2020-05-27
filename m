Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792A91E43F4
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 15:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387771AbgE0NjQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 09:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387682AbgE0NjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 09:39:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AC0C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:39:14 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id e125so14490526lfd.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7IMeiGJdd0FYaULVy4636lg33Zi1Eo+xbC8MLrlK33M=;
        b=qhLatUHgqLfV4Xq6ZptEJKI3WIOwhTDWt+nGbXejyZQfNYK6yalQG6/gnnNaDqaf54
         iVEDNDcBc9noGWGA2MNDUYFBXC2dmdXbwJoE2Lk0td1zagAkreQ/mJ83N3KuDjH/VhPp
         Hl97GzX8fYmmAZJOkfH8DLRpt/fBeWHdkLEhfDlHBjxSS4LOwO0oDS9uafcxM/fnOPva
         BgmvmqFElqkruf6NazcE59G53sf5Dv0EA4FRym7ELZR0DECGhS/31E9NRqlb4F7cqZGn
         LudEgRsGJGJ3TgUDoN70LU1Xg8nQ3nZ7G9kj3hD4JHTWd7HGWeULU6ybbroxzf8b7+RE
         mBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7IMeiGJdd0FYaULVy4636lg33Zi1Eo+xbC8MLrlK33M=;
        b=XgI+x8aZwikAek2lUovjq/q4doEWVaptMC5/xhqtnHlOT03DvDmp6KuyVfIbeAdjvm
         wCoEymM7y/iyEW6QZrnD32adYMlt0ZczF7/PgbUo4SmWEqHcieWN8md5CnDSBXK6GA/z
         xLquWGignpB5pqOz3Az7UDNzyVmgStay/6ZF+wSKvwFP2UpEECK4Zel9Mwji1fcx0RJD
         w1mmP/QTfzdzgRSreWKBISOAC835doYRotdc/J+8sEUof1Oh3tOsucJ3F216DOAwa4Z/
         o9OitJUleGluxEcC4Weq11tnoW18mGwtGcmdk11lDawyIFpzLmp9er6xKDlOo2g4fIvO
         H+IQ==
X-Gm-Message-State: AOAM531z65ZEyTzwuL9TjnEWkAwtG04VCjxzVzN6mmufHpuISc5JIw0h
        KG7VC+ZUJbneYOh4SJzfL5vImruSia1rB5Q3moC5Aw==
X-Google-Smtp-Source: ABdhPJyW0fQ0tWbaFJDowVTOuYP4TraX1jnB4ty+nO9srZMKHOfZWrP/fdkY7BtGLoHAlLt3U1zciwtQMOyMqbP0tQI=
X-Received: by 2002:a19:be87:: with SMTP id o129mr3127186lff.217.1590586753383;
 Wed, 27 May 2020 06:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200527093855.31024-1-brgl@bgdev.pl>
In-Reply-To: <20200527093855.31024-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 15:39:01 +0200
Message-ID: <CACRpkdbuDsOE9CtArxmqVdFm9WagFQppxH8JXxW3xUwZZf3E2Q@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.7
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 27, 2020 at 11:39 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> This is the last batch for fixes I'm sending your way in this release
> cycle. Please pull.

Pulled in for fixes! Will get this to Torvalds ASAP.

Yours,
Linus Walleij

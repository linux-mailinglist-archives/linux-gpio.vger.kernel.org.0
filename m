Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879336ABA5E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjCFJvs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjCFJvq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:51:46 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A078B206B9
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 01:51:44 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id o32so8509360vsv.12
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 01:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678096303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0qBQ4TjGtdId84PBbCh10qJCGOXpYF3xw6kE749yuU=;
        b=8HAmDk706mNoHnK3eatJ7Wr7PZyWH6YvlNszUdoFqhT36N6HN3ugxrjtJOf9mB4IVu
         nTrVYoGiV61oQaQ9Rzw1w0sAZkVkaGApyBdFoFVN0pvVik3DpjelmGt1HT+6foYo/xSG
         J78haxgaR55DMZDLXGv6IRT3wTkamBsDbadqtWG15etoFoJj05PyW3lkCLrF7SSlZkkJ
         us0od3J8DUdxujhGH995S5Jc2P4sBlrnxUYn3EP1pms/MKYcLc+oxhKyIvRNpe90MQL7
         RGe3hU68Ru7THhmxKFJEGb86wfPsQ66cTnTtFVqjbQ/CnGiTZx6gs4bQnRbY968fCFVL
         ubBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678096303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0qBQ4TjGtdId84PBbCh10qJCGOXpYF3xw6kE749yuU=;
        b=Hdtp/rS5jaCz6XXDp7sMrWVMpP0fc1fHEntns7jfpkkqIdJQ30BQG72FUJZxZ23niU
         urKsYbjozplJEhxQAFgtUi0NwNSi7QCskt9TQ0g8BLX2vfC/dpBYkQ4LXnNwZyP/peEo
         oP4/E0M5FfEbiibQds45cHM6/aLPH9+I3d3cdlZEwr+FoDSR9BZPl46GLstXAa04tP4V
         nRNUixVBbqFo4Hduv9y2oX3aop/BuOBn+5GRzDlsj2DyO1Ghlbx8bI27z9JoRruqnBmH
         mh6tSt7pO5uVQ5V2YHl1qGnVbgPWm7QnhWMbTINy/sCf1Z74tR8C73CHSc86L5bD4JjC
         wQ2A==
X-Gm-Message-State: AO0yUKWk7UjAT3vIhwir0AG52gBHaCrxl8bcYU4I0nsYmgiauylEx9VN
        r+DX7LJQCPIQ1on2iTK6NSJSoiP1mpupO1fcEmGnbQLjjldRzuaBh0Q=
X-Google-Smtp-Source: AK7set8OeLhDYZj2GhU575V1DNnYxSf2JWVSijOhCNCMaldEnl2BQe2bJEcdF6suqvMlrVzlXdvgalmY5MrVAFzlDj8=
X-Received: by 2002:a67:7305:0:b0:411:c666:583b with SMTP id
 o5-20020a677305000000b00411c666583bmr6931242vsc.5.1678096303699; Mon, 06 Mar
 2023 01:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20230216091909.1808306-1-linus.walleij@linaro.org>
In-Reply-To: <20230216091909.1808306-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:51:32 +0100
Message-ID: <CAMRc=MdN6TjuLfJ283-f0geR-Te+0+Fckig4XbJWxUYtrzTdcg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pmic-eic-sprd: Move Kconfig to MFD expanders
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Cixi Geng <cixi.geng1@unisoc.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 16, 2023 at 10:19=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> The Spreadtrum PMIC EIC interrupt controller is part of an
> MFD expander and should thus be in the MFD GPIO expander
> menu section with the rest. Move it.
>
> Cc: Cixi Geng <cixi.geng1@unisoc.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart

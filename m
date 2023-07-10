Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABD374DDF4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jul 2023 21:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbjGJTLL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jul 2023 15:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjGJTK6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jul 2023 15:10:58 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D68E1BE1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 12:10:26 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-440c368b4e2so1490350137.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jul 2023 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689016220; x=1691608220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgH9bF19P9qYpMUHf3fyLYC3kSHrwYWcNQb61WkbBZM=;
        b=Vq6UPox4lPif5+gZBUK67g6LMD1TrK55l2nw0aD1kQj6CrQU75rL3OkeKstIaTW+k3
         g5okbcseJqWyHbjqk5tXX+SU9k/63P4kMMCvsd+cvTZ6Fjlm7S3Hl8ZBGysF+9ug85Uw
         B+HGFKaHOkZ/xmCH3UmQoZaEQStjNdr0bdgyF13tXSsU5vKuc5xQ7P30MDukQDiAIRE6
         yMmGOUXBqr9RIbR0weNg2MOSf0Le3kMyXf0WWfomiX5CnsQ4gpd5CsCK8DblqI89eQI7
         0Rv11udrWvi1MQeSWav9uZ3yRvhDb31QrKCBPtSByef5zq2rHfZ0F1mPMmw/CIlFKuCm
         ADkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689016220; x=1691608220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgH9bF19P9qYpMUHf3fyLYC3kSHrwYWcNQb61WkbBZM=;
        b=RWOA4mOrhGvP0pfFYnTNZucDn4wNwYKY+ZjgHrX/1iNPMad4yW3fUKKxvA4huf4ZS6
         1OdLLT/T7Iu/xTXHb+q5S5IbCk0sTiTXoD2Rz+fNs4prRqc8iAz9nhDxxEpAlW220ipo
         vi1127TlhzBAGZzCh28pkvOywHcPd1XEeXMjrTiFgkte1A/IvXYwn+AHNP6x7BZ8McYI
         MNDXS+cAIEHsyqsX9iO+NRuEwvyOn4CmdsOAz6CiepnUGZEUTV81plKcnkN63XQ6g8rQ
         V86hhWUK1583U1u6nhUzZedJFZuk6DJAEzqnGzu2U5Kgo+piAoHhClNCfZroUXzc07jc
         HTNw==
X-Gm-Message-State: ABy/qLbQAI+0DHSX3ripwQNM5AuNU6enkCOMWF3LXZqhjMznER8Hv9rr
        5FDTq9scuunrZZyMAqcwcZHLbU506oyRnNgrw2OuVFjZoR1XoTlo
X-Google-Smtp-Source: APBJJlHXLYWRAK1TBPKRFK/U6CdwCO/hIgM870hTN2HBPd2woVKEs0qGvIqr0RD5faSdTjY9gqOFBzI0QfJO5AnH+i4=
X-Received: by 2002:a05:6102:2845:b0:443:874b:7d60 with SMTP id
 az5-20020a056102284500b00443874b7d60mr5970316vsb.26.1689016219912; Mon, 10
 Jul 2023 12:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230306211237.14876-1-asmaa@nvidia.com> <ZAZrKPw38ERSbzXg@surfacebook>
 <CH2PR12MB3895877A81288A737B702129D730A@CH2PR12MB3895.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3895877A81288A737B702129D730A@CH2PR12MB3895.namprd12.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Jul 2023 21:10:09 +0200
Message-ID: <CAMRc=McBXyzdCqEBi9ymVHL09xKzWOhjWKpE6xxzhVJotqnngw@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: mmio: handle "ngpios" properly in bgpio_init()
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 10, 2023 at 7:26=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wro=
te:
>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Hi Bart,
>
> Could you please add this patch to the tree?
>
> Thanks.
> Asmaa

No, because it doesn't apply to v6.5-rc1. Please rebase and resend to
my current email address.

Bartosz

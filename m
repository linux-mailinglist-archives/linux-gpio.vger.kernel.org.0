Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 633EC79C7B7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 09:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbjILHIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 03:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjILHIv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 03:08:51 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065C3E78
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:08:48 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6c09f1f9df2so4009382a34.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694502527; x=1695107327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hv2L+KIK91RPAfSw2HE5xZRSf6YXmZwJ93Tmif92bV4=;
        b=ZPLxvIO7m/wpbMggXrZCA0MgDeDF4lhohgq659wDL8HTV4jMEHST12M+ddIJB4Akin
         XdFHSlpma10tdAlAPD4Yl8r4UwpBtCze/I/oT24nRwoN1co/I6VNp/wcxfOfj4dPUnsN
         qLOAbNRMegITboSvKTMh1w+HbUS03DHbg03ChNwehVfLs7xLhr0Zi8dgL2TdnBjvwsTW
         zodTMXABYcuauGRPkMNT7Otvd+hX0ld5g2veuJZ6bK2aQO5bN1Co0xSr4xSwiKtwF8iF
         j3oZNJqzkSTjHYAcfLUBSVS77Ji2PTWBOyzKpSzhEDIkvujstLwL6wQHuY5xwNX/O48E
         Qy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502527; x=1695107327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv2L+KIK91RPAfSw2HE5xZRSf6YXmZwJ93Tmif92bV4=;
        b=O+QOI7x/t5P47oGrYN3CTXAJ3E+FudugdNDVaxUQ6g2ISy2FSp2oTVpwP9t5vWlA1Q
         6puKWelqqt7jJWrp8fTikRiPW1NrA5433ZUQILkxzUp5KKky63Ui4K/vOfOVuuZb2jQk
         o0mtyqj2qxUZipIFHKFO0vMqq1GPEeNdyupXt7znhQ7hHf3jgvHnZ/AJUpaAIC3SGK+X
         EtGgZhzBBjIq4b3dhbUzA5ZUAXK0j/DSZ4Jf1zkNiV8qdW6FikLdVECx6Lj4fTD0uh90
         5By2/iNp5C9dc7Y3C2arxjatsJi/HLBOWboYdNN6ploEkdVmjLcwsFd0qD6LqPFEOl9p
         S83A==
X-Gm-Message-State: AOJu0YxGbJ4slxLoGU9OzmpBapB4nfElwItkTaPnUt59eDFyw6DJo0Z3
        Hviw4k41xv8TumYrGF3AlNKxU4Pwyys6H1Qg5uXXlg==
X-Google-Smtp-Source: AGHT+IHBe3WqmlJ9znIl9UDkcdScIM2fyekx+hlEsGTzORc2dGYHkEZ989cOo3htoGUENtuvxLjItVsneETXU9qweME=
X-Received: by 2002:a9d:6e83:0:b0:6bf:1fed:95ce with SMTP id
 a3-20020a9d6e83000000b006bf1fed95cemr11702047otr.22.1694502527347; Tue, 12
 Sep 2023 00:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com> <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
 <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com> <811225f8-c505-7344-ac18-882472ee0348@redhat.com>
 <d232c11d-901f-4ebc-b408-bed042ed8da9@amd.com> <6734c409-89f1-89a1-3096-4054be29faf1@redhat.com>
 <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com>
In-Reply-To: <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 09:08:36 +0200
Message-ID: <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Shyam-sundar.S-k@amd.com,
        Basavaraj.Natikar@amd.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        lucapgl2001@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 31, 2023 at 7:53=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> Linus - please disregard version 1.

OK!

> I provided Luca a new series that implements this approach that Hans and
> I discussed and they confirmed it works.
>
> I have some minor modifications to it to narrow where it's applied so we
> don't have needless notifications and will send it for review after the
> new modifications are tested as well.

OK standing by, I'll wait for Hans' ACK and then merge it for fixes.

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5210058A9FC
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Aug 2022 13:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237946AbiHELO4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Aug 2022 07:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiHELO4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Aug 2022 07:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4283561D87
        for <linux-gpio@vger.kernel.org>; Fri,  5 Aug 2022 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659698094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2Qeiam5LSjrBXr0+KCiKDKpngILKKg5ElDVlDHWXmNg=;
        b=TdkCaggkSdB7CAf7Q3ukuQi7bFOGfbLy9OBCcEaSLRneSNsFB9ma1IIaLpb1HRr+mfNcfn
        XCorI97vLr6KQqoLvcm9iu3gZXVMwiwxFrjjWfupBnWGS3kwSYRDOeQ4jy8evplAKIH4CU
        e7XPv+94yDdLkM5tJD7wdPGVNGQaSUw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-TedAcGwwMEG4fzOyOmQr3g-1; Fri, 05 Aug 2022 07:14:53 -0400
X-MC-Unique: TedAcGwwMEG4fzOyOmQr3g-1
Received: by mail-ej1-f70.google.com with SMTP id sb17-20020a1709076d9100b00730fe97f897so576825ejc.16
        for <linux-gpio@vger.kernel.org>; Fri, 05 Aug 2022 04:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2Qeiam5LSjrBXr0+KCiKDKpngILKKg5ElDVlDHWXmNg=;
        b=sEiSiyIsKp2E/8qStjEbuLw9coLX9OiuYKb5cIXrIGP06Qza7PyEJAX3QFz+UkS0WR
         F4ui1xwqnJIeLlU7FXpdpGufzZzbXCx5WHE92DmD9zVyntPtjenDqFfa0aPsuwc5P9Tg
         mGTldLaZsjL35KObLGRfTg5qERG0QqPUlxgyeUzP6OQKfKOzfJ0Ua1RU8/8FiRO7EAMf
         UZgDMfHSzWoUQRBEPZtKKgZ9qCb2zvXElL4V7WdyVWHQdCgktwsUhyb92KJFld1sgyHJ
         5gw/92xfITWCNhvQUe8nH46oVOWQXyTRglWW1FcwNqo8Zeabie7XV1mXA9fLxsq7ZFTD
         F43Q==
X-Gm-Message-State: ACgBeo0AcVrtngU1dCG4R8+8OsgKWuP/1HHB3WoLWcet7zsvCqCKrrda
        xUxIBng2ES9CqmphZW/vk+Y2pfcMBNxkFX3+LIv1apwWlM2efVpyECiGJBfBSBy4kSxMTvF8qXm
        umKppoYrUvInzzywwlCBQDcrKbAw9ICDkbCR92g==
X-Received: by 2002:a05:6402:5193:b0:43e:1d52:fd70 with SMTP id q19-20020a056402519300b0043e1d52fd70mr6063333edd.150.1659698091851;
        Fri, 05 Aug 2022 04:14:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6fzsjYCRjR7pQ3e5fWR0MJhDrr27cWzpEtLn5C+50va2dLIr5UF8Vq7ZmKoioG3zOuoShNnT6vL2neriVmSc8=
X-Received: by 2002:a05:6402:5193:b0:43e:1d52:fd70 with SMTP id
 q19-20020a056402519300b0043e1d52fd70mr6063319edd.150.1659698091615; Fri, 05
 Aug 2022 04:14:51 -0700 (PDT)
MIME-Version: 1.0
From:   Robert Baumgartner <rbaumgar@redhat.com>
Date:   Fri, 5 Aug 2022 13:14:39 +0200
Message-ID: <CAKdJ40QqZt3MbeLNZ1fuYRgaTqSJeDaDdHkQSx1-KWCW4BcJPg@mail.gmail.com>
Subject: [libgpiod] How can I use PWM
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi team,

I try to migrate some python scripts for my Raspberry from RPi.GPIO to
libgpiod, but I miss PWM features.
Do I miss something? Or is it not available?

Some details: https://www.electronicwings.com/raspberry-pi/raspberry-pi-pwm=
-generation-using-python-and-c

Any help would be appreciated.
Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards

Robert Baumgartner
Senior Solution Architect OpenShift
Red Hat Austria GmbH, Firmenbuch Nr.: FN 479668w, Handelsgericht Wien

Millenniumtower 26. Stock
Handelskai 94-96
A-1200 Wien

robert.baumgartner@redhat.com
M: +43-660-5913883


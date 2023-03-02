Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB6B6A8C32
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Mar 2023 23:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjCBWvJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Mar 2023 17:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjCBWun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Mar 2023 17:50:43 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9195338010
        for <linux-gpio@vger.kernel.org>; Thu,  2 Mar 2023 14:50:42 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id x1so427340uav.9
        for <linux-gpio@vger.kernel.org>; Thu, 02 Mar 2023 14:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677797441;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rk43gdJq7ekS3uN/kF9B9dJLjB2pzj/mw4BMVJX6plA=;
        b=BjX6Tz5sj+V5lGc+3Hd6g0AsbzaRWPTK4VdwDi6tI7EvtdPCmaKZUbFgtXGM2xqB+x
         +4alrpLt796YKiR7esHQ3OcUxBEtssoaApnfnmTT5hqOPK8qP9um5Vq7OVPK/ArBF87T
         cGiAM3mn/RnDWRWi1Kr//OcB5j4I/8GeG4R7hJeDeRqHDMfZaywPgf4mNGe0DWZzfxtj
         gHc3DObM8icr5fS0lHNd+8CGoPtbq2e+ZizytytFPSuYYsRwzkbm/KlFvqc82ZbmUc7p
         o15/fyDtsRYDDFVHcina4X+hcHVL6v9N0bpPF3ZmTm5/qS6vHXpjQZwk7A75V2m3JziJ
         Synw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677797441;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rk43gdJq7ekS3uN/kF9B9dJLjB2pzj/mw4BMVJX6plA=;
        b=159RqmrrDHtWPDKyB6yCXAqtxu/bmgKNJ1SIGnvds8nuFpwcLlUDLZ9zEF44AVN87H
         nHQfE+PilCzBmBu0rEvv25oxn3wwPigYrbX40nnMnGJEHWn9uIl0nxhkvBOZMEyAbTYs
         PeShb/ZWrzOjd84x8UetEXzQ9u5tbMJIFoX6UsnqLBFMmqRc3RFAPcDmIaT4MYtqabbp
         iI8uAje14uwyrCrrZVUGBbpuKwkU6HzzV72CGt5U3KhbMOkqxU+BQo9SZdf75m4GaI2i
         bHnLcw9uaaHBUAINXTmQo9icV+MYpuetmTkQKlVO+ocb0+1lJ6Y5U8Wmnrr1eA8sfd5p
         h5gA==
X-Gm-Message-State: AO0yUKXVxXbfZovhnYnVOkWD3CZKNFyn4LQOR2G+P+YqJkFMJ0ng6hse
        PXBhG/4p6pSqL8czNwsLAZENei5Bz2+L37MqM0w=
X-Google-Smtp-Source: AK7set+oMaMpHyXWniwygp+cfQgbANl2yL3A6SyQf0sI4QOTeBGFBVkkVBas3yhPIsefpp8iPjGkBIXXSSGYct7LE1k=
X-Received: by 2002:a1f:a9c7:0:b0:401:73f4:dfe with SMTP id
 s190-20020a1fa9c7000000b0040173f40dfemr65106vke.3.1677797441647; Thu, 02 Mar
 2023 14:50:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d852:0:b0:3aa:a9b5:e0ef with HTTP; Thu, 2 Mar 2023
 14:50:41 -0800 (PST)
Reply-To: ab8111977@gmail.com
From:   MS NADAGE LASSOU <nadagelassou7@gmail.com>
Date:   Thu, 2 Mar 2023 23:50:41 +0100
Message-ID: <CAGkZahC2-9JVFVrZAOLAG10F63OCTFUS9s8KytZmMpRhVpcZmg@mail.gmail.com>
Subject: BUSINESS CO-OPERATION
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:929 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [nadagelassou7[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [nadagelassou7[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ab8111977[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Greetings.

I am Ms Nadage lassou,I have business to discuss with you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou

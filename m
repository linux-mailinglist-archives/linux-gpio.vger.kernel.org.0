Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF01267CA57
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 12:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjAZL6g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 06:58:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjAZL6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 06:58:36 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCDD62256
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 03:58:35 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id a11so2754984lfg.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 03:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo2uaUWCnGPs2Qiu0WPugIPlQhTGjXEujLrHd3U+iR8=;
        b=QjL4PulHGFIO8c83oFpPtxXyH7ZRO/AkVUS7MRfV2hgGOLsI/+iH1rEOgZ774AWVJn
         9tVpeTVWfZyZ7lOar0iFhYPS1xAqu+dBwGgu9Xpz7AUBfaosZ0EdSjYfr9d3kg8+ksMw
         kLo8kHlu0jasJRcTenReK0thzLOt+jy03yPS2DIbIL61BxfWzylr/29zBEGsEP/KSjWB
         FyYnUZUVLmXoo/4Z5SvIydvVypwIuf1VQW0uD7iEOMHJmq3d/08um9r0PO1fncFqn+JX
         AMWRslPQnS8iaqbHRBrGLJVHpGUMXgz0hNYLSEspjonODj60MwMWobATFZFXHkdPnYTW
         wq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo2uaUWCnGPs2Qiu0WPugIPlQhTGjXEujLrHd3U+iR8=;
        b=BhMtmZd071/hWCgMo1x6tqgsd5wgnTBsdGUEWU7AFQQCGqFZQFKGhXBhk940Sr6+Ad
         eu73ta+Xg/MBRVPFH7S3sQRn+IzfJqle6Z2dnQgYAlRjGLrbg0WFzRCPXQXcxEUUBtCc
         zvYKO7utP6icTXZ9aNyLyHLiqZVYfThW5Dq9V6nrbVbcRbUbyQR1jvwywNj3kllCOmo8
         YX2rCllRgRheOWYDTQgGcWJeQ3CXZiHhJOqpfyiY3/r+FLOPBCk+g7f0V0kQPrgP5D1M
         KpuuyFr/jdeTMH64CFd7HLomGYlW+kuXdrQ1QHtUopb0/bHgf5XH/itC5U0YRZxqQavd
         Lulw==
X-Gm-Message-State: AFqh2ko8Zzl4/mdk0fxdqWwHBHgXzDcEDI+/9nZQnWvczthrQdszHBBW
        35N3aLd7/YUZ+H1UFz40P4amYTvFY1KVuVE9Szw=
X-Google-Smtp-Source: AMrXdXu/pG02wzsnkape/vTK5yHMaGZuw8m/pAjci0/7G8m43hWUQFngpssUFEXBlOdKNgjZlYGdevDNoDQKfkmkdgI=
X-Received: by 2002:a19:760b:0:b0:4cc:586b:183c with SMTP id
 c11-20020a19760b000000b004cc586b183cmr3896361lff.350.1674734313349; Thu, 26
 Jan 2023 03:58:33 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:aa6:c207:0:b0:22a:910d:67f8 with HTTP; Thu, 26 Jan 2023
 03:58:32 -0800 (PST)
Reply-To: kl145177@gmail.com
From:   Ken Lawson <davidwolfgang046@gmail.com>
Date:   Thu, 26 Jan 2023 11:58:32 +0000
Message-ID: <CAFGUgZt8c_7e=RMLkrESRFOPQHb_e7xLa0+a1dCge97Ngq09GQ@mail.gmail.com>
Subject: I am still surprised why.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,YOU_INHERIT
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Best wishes to you and your family. I am still surprised why you
decided to abandon your family inheritance fund I just want to inform
you that the bank authority is not happy about it.

I am currently waiting to hear from you, for more details.

Yours sincerely,
Ken Lawson

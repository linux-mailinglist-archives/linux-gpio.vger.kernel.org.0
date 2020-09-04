Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4F225DBF6
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 16:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbgIDOkW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 10:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730416AbgIDOkU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 10:40:20 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A92DC061244
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 07:40:19 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a22so1851690ljp.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=JwWq5JGhKrq0fQjX+abmUvyg4pLULlEVHjNuHdjUPAQ=;
        b=cUpbSPssLi9WAHvlr+ertwV7BM9dlkgNo49XfYv4I9vwxWLfjOUE9NlxbexzMm+vXC
         QhkYQzdcp1FSdTopZwjM/klwuLhOBKIsZcN5zscndgJA7irDomxf5eeSWGoWiWcj18vS
         qntRIrJXiEP1klV3J9MC1y/0PN2X3EcpIe5ZT0HceMYxOl8YWc8Khk4QkL/CyvTtkpFG
         flEKmqrd7fVmpEyEx1TaizSJe/UamfT7lY/OpolNhPqf6OF2xJIkkOaoZMgI+UiQXPlJ
         UErDN2s37SgVoAH0Kr/hXc7Pk5oKuRfnEe+8yDqfEaeitHPNHue8GDK6pIgKbtplJv7b
         we6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=JwWq5JGhKrq0fQjX+abmUvyg4pLULlEVHjNuHdjUPAQ=;
        b=dPOMmBqMCgdUqhSP4vKIuEmCK9uezk3bztY52pCt+7R8SoTtqHoGi46jl18wPb1TjH
         X1D1eE/UXTGOh56xRGOxztSSdIc1A8IeQVWjHr7fdgySgGr03aO7HUOT0ZC7AlX/Iv3D
         tOfUT2dCMZD0O4HpQvBDSgSZZsVrPhLkqWm0jozbXCugSbm7YQbRdflaEhT1OnSkUy7g
         j5ZvLA5tI7X2hLlJPywWDBuThukKFcCemuVm04bC9+xic0l/+2w6xyKZBs7mOxMr/za3
         qdVB3iRueHxh2wD8cKtycwT1dx4j4RrM8VceE70GojGTkovZAa5iMQjZ3Y9FDds/0RvO
         AxVA==
X-Gm-Message-State: AOAM532qe2a6HfhjoD0+0az38KzJUIrvC6K8sIOyH7iES8uha2NZ+CFm
        z8emlrnFrF6BBruswkYhNNwNVqJOFHeLyqPfLCE=
X-Google-Smtp-Source: ABdhPJzwRXantzfkyJBVSZd/bmX2jHhtZK5iUME5NCQeZ+rivnnEbDwCmNkkrpsq+h/Vp9/tEjPcxuGu/XUDW6Kqrs4=
X-Received: by 2002:a2e:a483:: with SMTP id h3mr4096179lji.76.1599230417995;
 Fri, 04 Sep 2020 07:40:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c643:0:0:0:0:0 with HTTP; Fri, 4 Sep 2020 07:40:17 -0700 (PDT)
Reply-To: julianmarshalls@yahoo.com
From:   Barr Julian Marshall <avsky61@gmail.com>
Date:   Fri, 4 Sep 2020 07:40:17 -0700
Message-ID: <CAGBi6W0H_aXxOBOfE6Ccv2G2KC3g4RzD-FiHE0KNiPAozqN1_Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ich habe mich wegen der mit dieser Frage verbundenen Dringlichkeit
entschlossen, Sie zu kontaktieren. Ich bin Julian Marshall,
Rechtsanwalt. Ich pers=C3=B6nlich bin ein Treuhandagent von Dr. Edwin,
einem weithin bekannten unabh=C3=A4ngigen Auftragnehmer hier in Lome Togo,
der mit seiner Frau und seiner einzigen Tochter bei einem Autounfall
starb. Ich habe Sie kontaktiert, um mich bei der R=C3=BCckf=C3=BChrung von =
zwei
Millionen f=C3=BCnfhunderttausend Dollar auf Ihr Konto zu unterst=C3=BCtzen=
.
Bitte kontaktieren Sie mich f=C3=BCr weitere Informationen zu diesem Thema.

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6DF717BD0
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 11:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjEaJZT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 05:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235488AbjEaJYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 05:24:45 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCFE418B
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 02:24:43 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96ff9c0a103so791904666b.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685525082; x=1688117082;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rBZMqD+eVBYf4z9cHLSV2PQjO1DTn7Pq2KJTDAHdUCo=;
        b=u4te7RwenrY395X8YxWLwMUjiXK3dro3FH4FN7MhEr+LZDLY8nKcaZyt7DDCHCD+tL
         k0F5Iuoj01KXiKWSpiSqzlTjTlQI8Wf0Y7oIsDHxoDGLU6thhl9E2c8gG7W5grciB1az
         pdYHrT7DZaE5OYRQte3OPTVtbRTxGHhxlix1b4KYmb0zFmA06oegBkSIhaCfIE2Y2qhR
         lPmsWOUpJz7jbJfw6AgN/wVSWOm1hy2B4vT8XmQVBuopWVJSY5ajMHIXSBGPb/oRrMAn
         6f2IBcszNwD7bOH4h330ls+y4q4DSVi6tPvqt8hEJ5/vhJZGN37kFMRk9cq9+vR3PbzL
         6P9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685525082; x=1688117082;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBZMqD+eVBYf4z9cHLSV2PQjO1DTn7Pq2KJTDAHdUCo=;
        b=hjSsyuGTa8ScM1YfbVtBa0zQxHHNnFG0AhxvBNiTvo44Frb9giLnpnBnT4E5GN0xKM
         bGNOTqZUnKK+KZUhUELrF/gSvK8PvukTut/eOojMDUsrk/HE82MDZawH9kixUuhDtKzg
         0wmvM1AI9mxM8SC3qi/hGhcTTjpUdj8RY3LyFrwg5c6VXFn7V97vb9DxYRuRVhwhcLhM
         oauf/pDoOqyhHktOD/1u732bSkpW+ag89eflweGueT7X2BKbB/N9HEy4Kde1QRtVp1x9
         viysjsRJW0dZSxovQ1DYdlGylGviOnHpATB/IpGLhvfKNBFZnVOo+95cb4QiAgsRqL1j
         Ijqg==
X-Gm-Message-State: AC+VfDxZ8fiW4w5Hv+KBcoLQ3CBEgc63VgRVV/TnkSTV9j4m0W7Aj5RB
        +/VHmtTSw0+QInrO8QFRUXzq84ddx9m5hSPjIjM=
X-Google-Smtp-Source: ACHHUZ6AQtvPhHfOx2cwq5HinBD7hGDyALgMwvk+Cu39nTXyZ/2AXaWoY1Z9iEFhVoxo79TDfOcCHA==
X-Received: by 2002:a17:906:9756:b0:967:21:5887 with SMTP id o22-20020a170906975600b0096700215887mr4180476ejy.40.1685525082193;
        Wed, 31 May 2023 02:24:42 -0700 (PDT)
Received: from localhost (i5C741499.versanet.de. [92.116.20.153])
        by smtp.gmail.com with ESMTPSA id lk15-20020a170906cb0f00b0096f5781205fsm8638345ejb.165.2023.05.31.02.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:24:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 31 May 2023 11:24:41 +0200
Message-Id: <CT0CRWOTJIEO.20BGIDMLFM0E8@fedora>
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
Subject: Publishing libgpiod-sys and libgpiod to crates.io
From:   "Erik Schilling" <erik.schilling@linaro.org>
To:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
X-Mailer: aerc 0.14.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

After merging of [1] only some cosmetics should be missing from being
able to publish to crates.io.

First, we would need to agree on a version number (or rather a
release management process). Rust is suggesting people to follow a
SemVer approach [2] and I would strongly suggest to stick to that
recommendation. We _could_ just start releasing with the next libgpiod
release and have the Rust bindings follow the libgpiod releases. While
this may seem intuitive to users (they can just spell libgpiod =3D 2.0.1
and reason easily about which libgpiod version is in use), it would come
with a couple of implications:

1. Users would likely expect new features of a C lib release to also be
   usable from the Rust crate if it uses the same versioning scheme.
   So this would also tie the necessary effort to expose those features
   from the Rust bindings to the release process.
2. Supporting multiple versions of the C lib with the Rust bindings
   would be no problem in general, but would become awkward when trying
   to replicate the version numbers of the C lib.
3. Changes to the Rust bindings would always require an overall version
   bump.
4. There may be a conflict between SemVer bumps for the whole of
   libgpiod vs a bump that would be required for the Rust bindings only.

This all seems pretty restrictive and undesirable to me... So I would
recommend to manage the version numbers of libgpiod and the Rust crates
libgpiod-sys and libgpiod all separately. It may help to think of the
versions of the Rust crates as ABI versions (the C lib has its own
ABI version too!). This way we could :just get started with the version
numbers starting at 0.1.0 and start bumping them as needed for both
libgpiod and libgpiod-sys independently. Also, this means that uploading
to crates.io would not be strictly coupled to the release process of the
C lib and other bindings. That may allow to spread the load a little.

This may be slightly confusing to the user, but I hope it is less
confusing than the mess of what I listed above? Any opinions?

After agreeing on a versioning strategy, actually publishing to
crates.io should only require to add version number restrictions to the
libgpiod->libgpiod-sys dependency. It will then use that version for
installs from crates.io and use the `path` when building locally.

Once that small change is also done, I think we are ready for
publishing.

@Bart: How would you prefer to handle the upload of new versions? Or
would you prefer to be the one doing it or prefer if someone from the
community handles it? I can offer to help with documentation and setup
if needed :).

[1] https://lore.kernel.org/r/20230522-crates-io-v2-0-d8de75e7f584@linaro.o=
rg/
[2] https://doc.rust-lang.org/cargo/reference/semver.html

- Erik

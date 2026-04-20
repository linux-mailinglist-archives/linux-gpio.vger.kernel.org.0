Return-Path: <linux-gpio+bounces-35265-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFItEhkz5mlqtQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35265-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:07:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7EB42CA6D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 16:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0E2C30EF7B8
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 13:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135D33EF679;
	Mon, 20 Apr 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="np2+yb2Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C23EF66F;
	Mon, 20 Apr 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691526; cv=none; b=VjULE5fv+D+XQU9lp07hBqUDMvcLs8crhE/GrEF4nXX7AXxMAtXYBnQm/ISzUWJKLVzMonwh3Rfs2QmnBVsPIIYtmJHQth7EB5dzvTuoT06xYKwQkXSvy+ITv6J7csfIuwSrWKtueZ58J4r13FViSLW0OmRHRYW/CvEruFFoaLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691526; c=relaxed/simple;
	bh=ubS9T5/EslsE8hzijNiUf6dCFla8yAD2zRaeAPwLVXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mps+zNLhOBSSGLt+pzpZeYtMSHp3+bdDvQkiWg4CnkXCmuHxRvjayrB+Oy8bvKK1V6oCIXqdI+VOPKBJA3D4o3ONFRN3XqoZvLA+oRRzSW6xY5rWa2VeEbi1UeH8YhNAlbX4HsrGVOcEiJ72l3UenfyG/Cz7jvJTZpgoz4oreZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=np2+yb2Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6556C2BCB7;
	Mon, 20 Apr 2026 13:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691526;
	bh=ubS9T5/EslsE8hzijNiUf6dCFla8yAD2zRaeAPwLVXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=np2+yb2YuSpY10oMMFgGw6CV5VOsjo6I8HqYAh3hRPWo9ziRXj/A/r9KqKyhJpJ8z
	 i5xjaXUkQosoXAq4bJKBZp2RVeQsmKMroZ069k7eInYa0NV0XxZa7cY8Q2jCTPkJ7j
	 B3LXJCiXc9LIP+VgbeTLDvmF7YwH524aSHlTErxC7nKP9w4YaqXt1fu/YMD0EIQRhZ
	 3r1RN0GKsDfmk/qrsEdv+SJIsy4KHAAJUZZD2UcGfsED+mORtu1QfT4Lnd88MJTXcs
	 NT+ELmFTSxBAyS/Qq+ySDHn3r6DtIqz9+Q/JaHTdEzMCf4Xf7lan/Vx4KML0K4Wpl4
	 rmHwDazOdRUpg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tzuyi Chang <tychang@realtek.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] pinctrl: realtek: Fix return value and silence log for unsupported configs
Date: Mon, 20 Apr 2026 09:17:55 -0400
Message-ID: <20260420132314.1023554-81-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35265-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ernel.org:url,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,realtek.com:email]
X-Rspamd-Queue-Id: 6F7EB42CA6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

[ Upstream commit 6a6b238c66dc69cd784baf03b170c50f7e5f24d9 ]

Treating unsupported configurations as errors causes upper layers (like the
GPIO subsystem) to interpret optional features as hard failures, aborting
operations or printing unnecessary error logs.

For example, during gpiod_get(), the GPIO framework attempts to set
PIN_CONFIG_PERSIST_STATE. Since this driver does not support it, false
error reports are generated in dmesg.

Fix this by returning -ENOTSUPP and demoting the log level to dev_dbg.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information to provide a comprehensive analysis.

## Phase 1: Commit Message Forensics

**Step 1.1: Subject Line**
Record: [pinctrl: realtek] [Fix + silence] Fix return value and demote
log level for unsupported pinconf parameters.

**Step 1.2: Tags**
Record:
- Reviewed-by: Bartosz Golaszewski (GPIO subsystem maintainer)
- Signed-off-by: Tzuyi Chang (original author, the person who authored
  the driver in the first place)
- Signed-off-by: Yu-Chun Lin (series submitter)
- Signed-off-by: Linus Walleij (pinctrl subsystem maintainer)
- No Fixes: tag, no Cc: stable (expected)
- No Reported-by, no Link:

**Step 1.3: Commit Body Analysis**
Record: The commit explains a concrete failure mode: "Treating
unsupported configurations as errors causes upper layers (like the GPIO
subsystem) to interpret optional features as hard failures, aborting
operations..." With a specific example: during `gpiod_get()`, the GPIO
framework attempts to set `PIN_CONFIG_PERSIST_STATE`. Since the driver
returns `-EINVAL` (not `-ENOTSUPP`), `gpiod_get()` fails entirely. This
is a real functional bug, not cosmetic.

**Step 1.4: Hidden Bug Fix Detection**
Record: Marked as "silence log" which sounds cosmetic, but the `return
-EINVAL` -> `-ENOTSUPP` change is a real functional bug fix. The GPIO
layer's helper `gpio_set_config_with_argument_optional()` only swallows
`-ENOTSUPP`; `-EINVAL` propagates up and fails `gpiod_get()`.

## Phase 2: Diff Analysis

**Step 2.1: Inventory**
Record: 1 file, 2 lines changed (+2/-2), single function
`rtd_pconf_parse_conf()`, single-file surgical fix.

**Step 2.2: Code Flow Change**
Record: In the `default:` branch of the `switch ((u32)param)` in
`rtd_pconf_parse_conf`:
- BEFORE: `dev_err(...); return -EINVAL;`
- AFTER: `dev_dbg(...); return -ENOTSUPP;`

**Step 2.3: Bug Mechanism**
Record: Logic/correctness fix + return-code semantics fix. The pinctrl
API contract with gpiolib expects `-ENOTSUPP` for "feature not
implemented" so that optional config calls (like
`PIN_CONFIG_PERSIST_STATE` from `gpiod_set_transitory()`) are silently
ignored. Returning `-EINVAL` breaks this contract.

**Step 2.4: Fix Quality**
Record: Obviously correct. All the other branches in the same switch
already return `-ENOTSUPP` (see lines 297, 304, 317, 329, 415, 432, 449)
- the default path was the outlier. The companion function
`rtd_pin_config_get()` also already returns `-ENOTSUPP` in its default
(line 478). No regression risk - a change from a hard error to a soft
error for an inherently "unsupported" case.

## Phase 3: Git History Investigation

**Step 3.1: Blame**
Record: The buggy `return -EINVAL` was introduced in the original driver
commit `e99ce78030db2` ("pinctrl: realtek: Add common pinctrl driver for
Realtek DHC RTD SoCs"), which entered mainline in v6.7-rc1. Verified:
`git show e99ce78030db2` shows the buggy code was there from day one.

**Step 3.2: Fixes Tag**
Record: No Fixes tag present. Based on git blame, the effective "Fixes:"
would be `e99ce78030db2` ("pinctrl: realtek: Add common pinctrl driver
for Realtek DHC RTD SoCs"), which is in stable trees from v6.12 onwards.

**Step 3.3: File History**
Record: Between v6.12 and this fix, only 2 commits touch the file:
```
6a6b238c66dc6 pinctrl: realtek: Fix return value and silence log for
unsupported configs
a248904e30309 pinctrl: realtek: Cleanup license string
```
Standalone fix; no dependencies on other series patches.

**Step 3.4: Author**
Record: Tzuyi Chang is the original author of the Realtek pinctrl driver
(verified via `git log --author`). This is a fix from the subsystem
domain expert. Reviewed by Bartosz Golaszewski (GPIO subsystem
maintainer), and applied by Linus Walleij (pinctrl maintainer).

**Step 3.5: Dependencies**
Record: None. The default branch of a switch statement is self-
contained. Does not rely on any other patch in the v2 14-patch series.

## Phase 4: Mailing List Research

**Step 4.1: Lore Thread**
Record: b4 dig found: `https://lore.kernel.org/all/20260306075244.117039
9-3-eleanor.lin@realtek.com/`. Submitted as patch 2/14 of "pinctrl:
realtek: Core improvements and RTD1625 support".

**Step 4.2: Reviewers**
Record: b4 dig -w shows appropriate reviewers: Linus Walleij (pinctrl
maintainer), Bartosz Golaszewski (GPIO maintainer who added Reviewed-
by), linux-gpio ML. The RIGHT people reviewed this.

**Step 4.3: Series Revisions**
Record: b4 dig -a shows only v2 exists (no v3/v4 required). The v2
change was simply adding Bartosz's Reviewed-by; no behavior changes.

**Step 4.4: No stable tag in series**
Record: No `Cc: stable` was added in the patch or discussion. No
explicit stable nomination from reviewers - but this is expected for the
candidates being reviewed here.

**Step 4.5: Related prior art**
Record: Confirmed that a nearly-identical fix was already made for
`pinctrl-amd`: commit `87b549efcb0f7` ("pinctrl: amd: Don't show
`Invalid config param` errors"), which:
- Changed `dev_err` -> `dev_dbg` AND `-EINVAL` -> `-ENOTSUPP` for the
  same unsupported `PIN_CONFIG_PERSIST_STATE` scenario triggered by
  `gpiod_get()`
- Was explicitly marked with `Cc: stable@vger.kernel.org # 6.1`
- Was accepted to stable

This strongly validates that the pattern is considered stable material.

## Phase 5: Code Semantic Analysis

**Step 5.1: Functions**
Record: Single function: `rtd_pconf_parse_conf`.

**Step 5.2: Callers**
Record: Called from `rtd_pin_config_set`
(`drivers/pinctrl/realtek/pinctrl-rtd.c:493`). That is the
`.pin_config_set` callback used by the pinctrl framework. This is called
via pinctrl → gpiolib integration.

**Step 5.3/5.4: Call Chain (gpiod_get failure path)**
Record (verified in `drivers/gpio/gpiolib.c`):

```c
gpiod_get() ...
  -> gpiod_configure_flags()            // line 4897
    -> gpiod_set_transitory()           // line 4938 unconditional
      ->
gpio_set_config_with_argument_optional(PIN_CONFIG_PERSIST_STATE) // line
3228
        -> gpio_set_config_with_argument() -> pinctrl set_config
callback
         // Line 2721: "if (ret != -ENOTSUPP) return ret;"
         // -EINVAL propagates up as hard error
```

So every `gpiod_get()` on a Realtek RTD SoC was failing with -EINVAL.
This is reachable from `.probe()` of every device that requests a GPIO
via `gpiod_get()` - a very common operation.

**Step 5.5: Similar Patterns**
Record: Similar issue fixed in `pinctrl-amd` (87b549efcb0f7). Other
pinctrl drivers correctly use -ENOTSUPP. The helper
`gpio_set_config_with_argument_optional()` has existed since v5.11-rc1
(commit `baca3b15cd2a1`), so the `-ENOTSUPP` contract is long-standing.

## Phase 6: Cross-referencing and Stable Tree Analysis

**Step 6.1: Where does the buggy code exist?**
Record (verified via `git show v<TAG>:drivers/pinctrl/realtek/pinctrl-
rtd.c`):
- v6.6: driver does NOT exist (not affected)
- v6.12: buggy code present (affected)
- v6.13: buggy code present (affected)
- v6.15: buggy code present (affected)
- Active stable trees affected: 6.12.y and later LTS/stable branches

**Step 6.2: Backport Complexity**
Record: Only 2 commits touched this file between v6.12 and the fix, and
the other is a license string cleanup. The surrounding context in the
`default:` branch has not changed since driver introduction. Clean apply
expected.

**Step 6.3: Related fixes already in stable**
Record: None found for this specific issue in pinctrl-rtd.

## Phase 7: Subsystem Context

**Step 7.1: Subsystem/Criticality**
Record: Subsystem: pinctrl (specifically Realtek DHC RTD SoC pinctrl).
Hardware-specific, but on these platforms it affects ALL users since the
failure is in a very common GPIO path (`gpiod_get()`). Criticality:
IMPORTANT for Realtek RTD users.

**Step 7.2: Subsystem Activity**
Record: Actively developed; the fact that the bug wasn't previously
caught suggests limited runtime coverage, but once a consumer calls
`gpiod_get()` it breaks.

## Phase 8: Impact and Risk Assessment

**Step 8.1: Affected Users**
Record: Users of Realtek DHC (Digital Home Center) RTD SoCs, e.g.,
RTD1xxx family (TV/STB/embedded ARM64 systems). Driver-specific, but
universal across those platforms.

**Step 8.2: Trigger**
Record: Any caller of `gpiod_get()` / `gpiod_get_index()` / similar in a
driver that targets a Realtek RTD SoC. Common paths: every probe
function requesting a GPIO line. No privilege needed — triggered during
normal boot.

**Step 8.3: Failure Mode**
Record: `gpiod_get()` returns `-EINVAL` with log "setup of GPIO %s
failed: -22". Consumer driver probe fails. Depending on device: missing
hardware support (HDMI detect, reset pins, regulator enables) -
effectively device breakage on affected SoCs. Severity: HIGH.

**Step 8.4: Risk/Benefit**
Record:
- BENEFIT: Restores correct `gpiod_get()` operation on Realtek RTD SoCs;
  eliminates false error messages. HIGH benefit for that user
  population.
- RISK: Changing a log-level and an errno value. Only affects the
  error/unsupported path. All other callers of this pinctrl driver that
  use supported params are unaffected. VERY LOW risk.

## Phase 9: Final Synthesis

**Step 9.1: Evidence**

FOR backporting:
- Fixes a real functional bug: `gpiod_get()` fails entirely on Realtek
  RTD SoCs
- Small, surgical, obviously-correct change (2 lines)
- Fix aligns with how all other `-ENOTSUPP` returns in the same file
  work
- Reviewed by the GPIO subsystem maintainer (Bartosz Golaszewski)
- Applied by the pinctrl maintainer (Linus Walleij)
- An identical conceptual fix was already backported to stable for
  `pinctrl-amd` (commit `87b549efcb0f7` with `Cc: stable # 6.1`)
- Buggy code present since v6.7-rc1, exists in current LTS (6.12.y) and
  later
- No dependencies on the rest of the 14-patch series
- Clean apply expected

AGAINST backporting:
- No explicit Cc: stable or Fixes: tag (expected; that is why this is a
  candidate for review)
- No Reported-by or user bug link (but the commit message clearly
  describes the failure mechanism and the fix is obviously correct)

**Step 9.2: Stable Rules Checklist**
1. Obviously correct and tested: YES (matches the GPIO contract; all
   sibling branches already use -ENOTSUPP)
2. Fixes a real bug affecting users: YES (gpiod_get() failure)
3. Important issue: YES (driver/GPIO broken = device probe failures)
4. Small and contained: YES (2 lines in one function)
5. No new features/APIs: YES (pure bug fix)
6. Can apply to stable: YES (clean apply expected on 6.12.y+)

**Step 9.3: Exception**
Not applicable (this is a straightforward bug fix, not a special
exception category).

**Step 9.4: Decision**
Strong YES.

## Verification

- [Phase 1] Parsed tags: Reviewed-by: Bartosz Golaszewski; Signed-off-
  by: author + Linus Walleij. No Fixes, no Cc:stable.
- [Phase 2] Diff: Verified 2-line change in `rtd_pconf_parse_conf`
  default branch, converting `dev_err + -EINVAL` to `dev_dbg +
  -ENOTSUPP`. Context shows all other error cases in same switch already
  return `-ENOTSUPP`.
- [Phase 3] `git blame`/`git show e99ce78030db2`: Verified buggy code
  was present from the driver's original commit.
- [Phase 3] `git describe --contains e99ce78030db2`: returns
  `v6.7-rc1~70^2~58` - driver added in v6.7-rc1.
- [Phase 3] `git log v6.12..6a6b238c66dc6 --
  drivers/pinctrl/realtek/pinctrl-rtd.c`: Only 2 commits between v6.12
  and the fix - clean backport.
- [Phase 4] `b4 dig -c 6a6b238c66dc6`: Found lore thread `https://lore.k
  ernel.org/all/20260306075244.1170399-3-eleanor.lin@realtek.com/`,
  matched by patch-id.
- [Phase 4] `b4 dig -a`: Only v2 exists; v2 changelog shows only "Add
  Bartosz's Reviewed-by tag" (no code change from v1).
- [Phase 4] `b4 dig -w`: Verified linusw@kernel.org,
  bartosz.golaszewski@oss.qualcomm.com, linux-gpio@vger.kernel.org on
  the thread.
- [Phase 4] `git show 87b549efcb0f7`: Confirmed `pinctrl-amd` got the
  same conceptual fix with `Cc: stable@vger.kernel.org # 6.1`.
- [Phase 5] Verified call chain in `drivers/gpio/gpiolib.c`: `gpiod_get`
  → `gpiod_configure_flags` (line 4771/4897) → `gpiod_set_transitory`
  (line 4938) → `gpio_set_config_with_argument_optional` (line 3228)
  which only swallows `-ENOTSUPP` (line 2721).
- [Phase 5] `git describe --contains baca3b15cd2a1`: helper added in
  v5.11-rc1; present in all LTS trees of interest.
- [Phase 6] Verified via `git show
  v6.12/v6.13/v6.15:drivers/pinctrl/realtek/pinctrl-rtd.c`: buggy code
  present in all; v6.6 does not contain driver.
- [Phase 8] Verified caller at `drivers/gpio/gpiolib.c:4771`: on error,
  `gpiod_put(desc)` + `dev_err(... setup of GPIO %s failed: %d)` - user-
  visible failure.
- UNVERIFIED: Could not retrieve dmesg logs from an actual Realtek RTD
  device (no hardware access), but the code path analysis is definitive.
- UNVERIFIED: Did not check every single 6.7.y-6.11.y tree individually
  - these are EOL so not relevant for current backport targets.

The fix is small, surgical, obviously correct, reviewed by the
appropriate maintainers, and an exact precedent (`pinctrl-amd`
87b549efcb0f7) was previously accepted to stable. It fixes a concrete
functional failure (`gpiod_get()` breakage on Realtek RTD SoCs) present
in active LTS 6.12.y and later.

**YES**

 drivers/pinctrl/realtek/pinctrl-rtd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 2440604863327..8d7cdb18cf773 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -456,8 +456,8 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		break;
 
 	default:
-		dev_err(data->dev, "unsupported pinconf: %d\n", (u32)param);
-		return -EINVAL;
+		dev_dbg(data->dev, "unsupported pinconf: %d\n", (u32)param);
+		return -ENOTSUPP;
 	}
 
 	ret = regmap_update_bits(data->regmap_pinctrl, reg_off, mask, val);
-- 
2.53.0


